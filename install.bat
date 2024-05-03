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
    REM echo 'set http_proxy=http://127.0.0.1:7890' >> %USERPROFILE%\proxy.bat
    REM echo 'set https_proxy=http://127.0.0.1:7890' >> %USERPROFILE%\proxy.bat
    REM echo 'set socket_proxy=http://127.0.0.1:7890' >> %USERPROFILE%\proxy.bat
    REM echo 'set all_proxy=http://127.0.0.1:7890' >> %USERPROFILE%\proxy.bat
    copy /y "%curDir%\configuration\proxy.bat" "%USERPROFILE%\proxy.bat"
)
set http_proxy=http://127.0.0.1:7890
set https_proxy=http://127.0.0.1:7890
set all_proxy=http://127.0.0.1:7890
set socket_proxy=http://127.0.0.1:7890

:: ycm
set /p ycmOpt=Would you like to install ycm? [y/n] 
echo %userInput%

if "%ycmOpt%" equ "y" (
    :: 选择ycm补全方案
    echo ^"^{^{^{^> complete scheme >> %USERPROFILE%\.vimrc.custom.config
    echo ^"   0: vim build-in scheme >> %USERPROFILE%\.vimrc.custom.config
    echo ^"   1: ycm >> %USERPROFILE%\.vimrc.custom.config
    echo ^"   2: vimautosense >> %USERPROFILE%\.vimrc.custom.config
    echo ^"   3: vim-auto-popmenu >> %USERPROFILE%\.vimrc.custom.config
    echo let g:completeScheme=1 >> %USERPROFILE%\.vimrc.custom.config
    echo ^"^<^}^}^} >> %USERPROFILE%\.vimrc.custom.config
    echo. >> %USERPROFILE%\.vimrc.custom.config
    echo. >> %USERPROFILE%\.vimrc.custom.config

    :: copy ycm config
    copy /y "%curDir%\configuration\.ycm_extra_conf.py" "%USERPROFILE%\.ycm_extra_conf.py"
    copy /y "%curDir%\configuration\vimrc.ycm.config"  "%USERPROFILE%\.vimrc.ycm.config"
    echo The following softwares need to be installed:
    echo ^- python2 or python3^(recommended^)
    echo ^- cmake
    echo ^- "Desktop development with C++" under workload in Visual Studio, where ycm supports MSVC 14 ^(Visual Studio 2015^) and 15 ^(2017^)
    echo ^- ctags
) else (
    :: 选择非ycm补全方案
    echo ^"^{^{^{^> complete scheme >> %USERPROFILE%\.vimrc.custom.config
    echo ^"   0: vim build-in scheme >> %USERPROFILE%\.vimrc.custom.config
    echo ^"   1: ycm >> %USERPROFILE%\.vimrc.custom.config
    echo ^"   2: vimautosense >> %USERPROFILE%\.vimrc.custom.config
    echo ^"   3: vim-auto-popmenu >> %USERPROFILE%\.vimrc.custom.config
    echo let g:completeScheme=2 >> %USERPROFILE%\.vimrc.custom.config
    echo ^"^<^}^}^} >> %USERPROFILE%\.vimrc.custom.config
    echo. >> %USERPROFILE%\.vimrc.custom.config
    echo. >> %USERPROFILE%\.vimrc.custom.config

)

echo please add ^`alias vim=^'^<vim_absolute_path^>^'^` to %USERPROFILE%\.bashrc to support gvim in git. Note: In .bashrc file, a / is inserted before a space, and the path separator is /
echo     e.g.: echo alias vim=^'E:/Program\ Files/Vim/vim91/vim.exe^' ^>^> %USERPROFILE%\.bashrc

:: install plugin
vim -c "PlugInstall" -c "q" -c "q"

cd %curDir%


