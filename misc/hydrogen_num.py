#!/usr/bin/env python

"""
Script to calculate the exchange-correlation energies of singly excited hydrogen atom.
"""

from sympy import integrate, diff, Ynm, symbols, oo, assoc_legendre
from sympy.physics.hydrogen import R_nl
from sympy.physics.quantum.cg import CG                                                                                                                             
from sympy.utilities.lambdify import lambdify

import numpy as np
from math import factorial, pi, exp, sqrt

r1, r2, r = symbols("r1 r2 r")

def cg(l0,l,m):
  return CG(l0,0, l,m, l,m).doit()

def x_ex(n,l,m):
  x_ex = 0.0
  for l0 in range(2*l+1):
    # zenghui's note for more general cases:  cg(l0,lj,0)*cg(l0,lj,mj) * cg(l0,li,0)*cg(l0,li,mi)
    x_ex += (cg(l0,l,0)*cg(l0,l,m))**2 * \
            ( integrate( R_nl(n, l, r1)**2 * \
                (r1**(1-l0) * integrate( r2**(l0+2) * R_nl(n, l, r2)**2, (r2, 0, r1)) \
              + r1**(l0+2) * integrate( R_nl(n,l,r2)**2 * r2**(1-l0), (r2, r1, oo))), (r1, 0, oo)) )
  return -x_ex/2

def pref_ylm(l,m):
  return (2*l+1)*factorial(l-m)/(4.0*pi*factorial(l+m)) # already squared

def pref_omg(l,m):
  return pref_ylm(l,m)**(4./3.) * (2.0*pi) # phi

def Rnl(n,l, x):
  return lambdify(r, R_nl(n,l,r), modules=['numpy'])(x)

def Plm(l,m, x):
  # assoc_legendre return a number 0 for l=m=0
  if l==0 and m==0: return np.ones_like(x)
  else: return lambdify(r, assoc_legendre(l,m,r), modules=['numpy'])(x)

def dRnl(n,l, x):
  return lambdify(r, diff(R_nl(n,l,r), r), modules=['numpy'])(x)

def dPlm(l,m,x):
  if l==0 and m==0: return np.zeros_like(x)
  else: return lambdify(r, diff(assoc_legendre(l,m,r),r), modules=['numpy'])(x)

r0 = 5e-6
dx = 0.04
xx = np.arange(1, 400)*dx
rx = r0*np.exp(xx)
rx2 = rx**2
rx3 = rx**3

dt = 0.01
rt = np.arange(-100, 100)*dt + 0.5*dt 

spin_sf = 2**(1./3)

pref_ldax = -0.75*(3/pi)**(1./3.) * spin_sf
pref_s = 1.0/ (3*pi**2)**(1./3)

pref_scan0lda = 1.16588
pref_scan0 = 1.174 
scan0_a1 = 4.9479 

pbe_k, pbe_m, pbe_g, pbe_b = 0.804, 0.21951, 0.031091, 0.066725
pbe_ph1 = 0.7937005259840997 # phi(Z=1) = 0.5*( (1+Z)**(2./3) + (1-Z)**(2./3)  )

pw_A_sp, pw_a1_sp, pw_b1_sp, pw_b2_sp, pw_b3_sp, pw_b4_sp, pw_p_sp = 0.015545, 0.20548, 14.1189, 6.1977, 3.3662, 0.62517, 1.00 

tpss_k, tpss_m, tpss_b, tpss_c, tpss_e = 0.804, 0.21951, 0.40, 1.59096, 1.537
ten_81 = 10.0/81

results = []
print "{0:1} {1:1} {2:>2} {3:>24}".format('N', 'L', 'M', "EXACT"),
print "".join( [ "{0:>10}".format(x) for x in ['Exact', 'SCAN0LDA', 'SCAN0GGA', 'TPSS', 'LSDA', 'PBE', 'X_LSDA', 'C_PW92', 'X_PBE', 'C_PBE', ' Exact/X_LSDA']])
for n in range(1, 3):
  for l in range(n):
    
   #int_r  = ((Rnl(n,l,rx)**2)**(4./3) * rx3).sum() * dx

   #for m in range(-l, l+1):
    for m in range(0, l+1):
     #int_omg = ((pref_ylm(l,m)*Plm(l,m,rt)**2)**(4./3)).sum() * dt 
      
     #x_lda = int_r * int_omg
     #x_lda *= 2.0*pi * pref_ldax

     #x_scan0_lda = x_lda * pref_scan0lda 

      rxm = rx.reshape((1,len(rx)))
      rx3m = rx3.reshape((1,len(rx)))
      rtm = rt.reshape((len(rt),1))

      s = pref_s * ( (Plm(l,m,rtm)*dRnl(n,l,rxm))**2 + (Rnl(n,l,rxm)*dPlm(l,m,rtm)/rxm)**2*(1-rtm**2) )**0.5 \
          / (abs(Rnl(n,l,rxm)*Plm(l,m,rtm))**(5./3) * pref_ylm(l,m)**(1./3)) 

      rho = (Rnl(n,l,rxm)*Plm(l,m,rtm))**2*pref_ylm(l,m)

      x_lda = np.sum( rx3m * rho**(4./3) )
      x_lda *= dx * dt * 2.0*pi * pref_ldax
      x_scan0_lda = x_lda * pref_scan0lda

      x_scan0_gga = np.sum( rx3m * rho**(4./3) * (1 - np.exp( -scan0_a1 * (s/spin_sf)**(-0.5))) )
      x_scan0_gga *= dx * dt * 2.0*pi * pref_scan0 * pref_ldax

      p = (s/spin_sf)**2  # add spin scalling here
      p2 = p**2
      p3 = p2*p
      qb = -9./20 + (2./3)*p
      tpss_x_mat =  (   (ten_81+0.25*tpss_c)*p \
                      + (146./2025)*qb**2 \
                      - (73./405)*qb * (0.18 + 0.5*p2)**0.5 \
                      + ((1/tpss_k)* ten_81**2)*p2 \
                      + 2 * sqrt(tpss_e) * ten_81 * 0.36 \
                      + (tpss_e*tpss_m)*p3  ) \
                  / (1+sqrt(tpss_e)*p)**2

      x_tpss = np.sum( rx3m * rho**(4./3) * (1+tpss_k - tpss_k/(1+tpss_x_mat/tpss_k)) )
      x_tpss *= dx * dt * 2.0*pi * pref_ldax 

      x_pbe = np.sum( rx3m * rho**(4./3) * (1+pbe_k - pbe_k/(1+pbe_m*(s/spin_sf)**2/pbe_k)) )
      x_pbe *= dx * dt * 2.0*pi * pref_ldax

      rs = ((0.75/pi)/rho)**(1./3)
      rs_1h = rs**0.5
      rs_3h = rs_1h**3
      rs_4h = rs**2 
  
     #c_pw_mat = (-2*pw_A_sp)*(1+pw_a1_sp*rs)*np.log(1+ (0.5/pw_A_sp)/(pw_b1_sp*rs_1h + pw_b2_sp*rs + pw_b3_sp*rs_3h + pw_b4_sp*rs_4h))
      xmat = (0.5/pw_A_sp)/(pw_b1_sp*rs_1h + pw_b2_sp*rs + pw_b3_sp*rs_3h + pw_b4_sp*rs_4h)
      lnxmat = np.log(1+xmat)
      c_pw_mat = (-2*pw_A_sp)*(1+pw_a1_sp*rs)*((lnxmat==0)*xmat + lnxmat)
      c_pw92 = np.sum(rx3m * rho * c_pw_mat) * (dx * dt * 2.0*pi)

      t = s * rho**(1./6) * ( ((3*pi**5)**(1./6)) / (pbe_ph1*2) )
      t_2 = t**2

     #pbe_A_mat = (pbe_b/pbe_g) / ( np.exp( -c_pw_mat / (pbe_g * pbe_ph1**3) ) - 1.0 )
      xmat = -c_pw_mat / (pbe_g * pbe_ph1**3)
      exmat = np.exp(xmat) - 1.0
      pbe_A_mat = (pbe_b/pbe_g) / (exmat + (exmat==0.0)*xmat)

     #H_pbe_mat = (pbe_g*pbe_ph1**3)*np.log(1.0+ (pbe_b/pbe_g)*t_2*(1.0+pbe_A_mat*t_2)/(1+pbe_A_mat*t_2 + (pbe_A_mat*t_2)**2))
      xmat = (pbe_b/pbe_g)*t_2*(1.0+pbe_A_mat*t_2)/(1+pbe_A_mat*t_2 + (pbe_A_mat*t_2)**2)
      lnxmat = np.log(1+xmat)
      H_pbe_mat = (pbe_g*pbe_ph1**3)*((lnxmat==0)*xmat + lnxmat)
      H_pbe = np.sum(rx3m * rho * H_pbe_mat) * (dx * dt * 2.0*pi)

      c_pbe = c_pw92 + H_pbe
      xc_lda = x_lda + c_pw92
      xc_pbe = x_pbe + c_pbe
      print 0, x_pbe , c_pbe, c_pw92, H_pbe
      results.append([n, l, m, x_ex(n,l,m), x_ex(n,l,m).evalf(), x_scan0_lda, x_scan0_gga, x_tpss, xc_lda, xc_pbe])
      ex = results[-1]
      print "{0:1} {1:1} {2: 2d} {3:>24}".format(ex[0],ex[1],ex[2], ex[3]),
      print "".join(['{0:10.6f}'.format(x) for x in ex[4:] + [x_lda, c_pw92, x_pbe, c_pbe, x_ex(n,l,m).evalf()/x_lda] ]) 
   ## normalization check, should print 1.0
   #y = np.array([R_nl(n,l,x)**2 for x in rx]) * rx**2 *rx
   #print simps(y,xx)

results = np.array(results)
print "\n#--\n"
print "{0:1} {1:1} {2:>2} {3:>24}".format('N', 'L', 'M', "EXACT"),
print "".join( [ "{0:>10}".format(x) for x in ['SCAN0LDA', 'SCAN0GGA', 'TPSS', 'LSDA', 'PBE']])
for ex in results:
  print "{0:1} {1:1} {2: 2d} {3:>24}".format(ex[0],ex[1],ex[2], ex[3]),
  print "".join(['{0:10.6f}'.format(x/ex[4]) for x in ex[5:] ])
