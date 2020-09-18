Powershell is banned, and Windows OS is basically my only choice in my current company, so I customized my cmd.exe:

1, cmd settings:
	Options | Command History | Buffer Size | 500
	Options | Command History | Discard Old Duplicates | True
	Options | Edit Options | QuickEdit Mode | True
	Layout | Screen buffer size | Height | 9999
	Layout | Window size | Height | 36
	
* Pressing arrow up selects a previous command from your command history; similarly, arrow down selects the next command.
* Pressing F7 pops up your command history list.
* You can drag n' drop files or folders from an explorer window into a command prompt.
* Tab completion is fully supported for filenames and commands. Use SHIFT+TAB to move to the previous match.
* ALT+ENTER takes your command prompt to fullscreen mode and back again.


2, alias

2.1 file cmd_alias.bat
@echo off 

:: More Linux-like
doskey clear=cls
doskey history=doskey /H $*
doskey ~=cd /D %HOMEDRIVE%%HOMEPATH%

:: do not use ls since doskey does not support pipe
doskey ls=C:\gnuwin32\bin\ls.EXE -F $*
doskey ll=C:\gnuwin32\bin\ls.EXE -alF $*

:: quit quickly
doskey q=exit

:: notepad++
doskey    np="C:\Program Files\Notepad++\notepad++.exe" $*
doskey alias="C:\Program Files\Notepad++\notepad++.exe" "C:\Users\#####\Downloads\pkgs\cmd_alias.bat"

:: Anaconda envs
:: doskey   condaa=C:\Users\#####\Anaconda3\condabin\conda.BAT activate
doskey      py=python $*
doskey  condad=@echo off $T$T C:\Users\#####\Anaconda3\condabin\conda.BAT deactivate $T$T set CONDA_FORCE_32BIT= $T$T echo on

doskey    py38=@echo off $T$T set CONDA_FORCE_32BIT= $T$T C:\Users\#####\Anaconda3\Scripts\activate base     $T$T echo on
doskey    py37=@echo off $T$T set CONDA_FORCE_32BIT= $T$T C:\Users\#####\Anaconda3\Scripts\activate py37     $T$T echo on
doskey    py27=@echo off $T$T set CONDA_FORCE_32BIT= $T$T C:\Users\#####\Anaconda3\Scripts\activate py27     $T$T echo on

doskey py37_32=@echo off $T$T set CONDA_FORCE_32BIT=1 $T$T C:\Users\#####\Anaconda3\Scripts\activate py37_32 $T$T echo on
doskey py27_32=@echo off $T$T set CONDA_FORCE_32BIT=1 $T$T C:\Users\#####\Anaconda3\Scripts\activate py27_32 $T$T echo on


2.2 file cmd_alias.reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor]
"AutoRun"="C:\\Users\\#####\\Downloads\\pkgs\\cmd_alias.bat"


