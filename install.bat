@echo off

set curDir=%CD%
set vimConfigPath=%USERPROFILE%\vimfiles
if exist vimConfigPath (
    exit /b 0
)

:: copy configures
copy /y "%curDir%\configuration\_vimrc" "%USERPROFILE%\_vimrc"
copy /y "%curDir%\configuration\.vimrc.custom.config" "%USERPROFILE%\.vimrc.custom.config"
copy /y "%curDir%\configuration\.vimrc.custom.plugins" "%USERPROFILE%\.vimrc.custom.plugins"

:: copy settings
xcopy "%curDir%\autoload" "%vimConfigPath%\autoload" /E /I /H /K /y
xcopy "%curDir%\colors" "%vimConfigPath%\colors" /E /I /H /K /y
xcopy "%curDir%\docs" "%vimConfigPath%\docs" /E /I /H /K /y
xcopy "%curDir%\ftplugin" "%vimConfigPath%\ftplugin" /E /I /H /K /y
xcopy "%curDir%\plugin_configuration" "%vimConfigPath%\plugin_configuration" /E /I /H /K /y
xcopy "%curDir%\settings" "%vimConfigPath%\settings" /E /I /H /K /y

:: set proxy
if not exist %USERPROFILE%\proxy.bat (
    echo http_proxy=http://127.0.0.1:7890 >> %USERPROFILE%\proxy.bat
    echo https_proxy=http://127.0.0.1:7890 >> %USERPROFILE%\proxy.bat
    echo socket_proxy=http://127.0.0.1:7890 >> %USERPROFILE%\proxy.bat
    echo all_proxy=http://127.0.0.1:7890 >> %USERPROFILE%\proxy.bat
)
set http_proxy=http://127.0.0.1:7890
set https_proxy=http://127.0.0.1:7890
set all_proxy=http://127.0.0.1:7890
set socket_proxy=http://127.0.0.1:7890

:: ycm
set /p ycmOpt=Would you like to install ycm? [y/n] 
echo %userInput%

if "%ycmOpt%" equ "y" (
    copy /y "%curDir%\configuration\.ycm_extra_conf.py" "%USERPROFILE%\.ycm_extra_conf.py"
    copy /y "%curDir%\configuration\vimrc.ycm.config"  "%USERPROFILE%\.vimrc.ycm.config"
)

:: install plugin
vim -c "PlugInstall" -c "q" -c "q"

cd %curDir%
