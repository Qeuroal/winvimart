@echo off

set curDir=%CD%
set vimConfigPath=%USERPROFILE%\vimfiles

del /Q %USERPROFILE%\vimfiles
del /Q %USERPROFILE%\_vimrc
del /Q %USERPROFILE%\.vimrc.custom.config
del /Q %USERPROFILE%\.vimrc.custom.plugins
del /Q %USERPROFILE%\.ycm_extra_conf.py
del /Q %USERPROFILE%\.vimrc.ycm.config

