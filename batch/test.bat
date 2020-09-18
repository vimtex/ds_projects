for /f "usebackq skip=1 tokens=2-4 delims=(-)" %%a in (`echo/^ | date`) do ( 
   for /f "usebackq tokens=%t%-4 delims=.-/ " %%d in (`date/t`) do ( 
      set %%a=%%d&set %%b=%%e&set %%c=%%f)) 
