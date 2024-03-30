# installing all completers

## prepare (minimum installation)

- CMake

- Vim

- Python3

   建议不要最新版

- VS2022

   组件:

   - MSVC v143 - VS 2022 C++ x64/x86 生成工...
   - C++ Build Insights
   - 用于 Windows 的C++ CMake工具
   - Windows 11 SDK(10.0.22621.0)

## Quick start, installing all completers

1. Install YCM plugin via [vim-plug](https://github.com/junegunn/vim-plug) or [Vundle](https://github.com/VundleVim/Vundle.vim#about)
2. Install [Visual Studio Build Tools 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16)
3. Install CMake, Vim and Python
4. Install go, node and npm
5. Compile YCM supporting all language

   ```bash
   cd YouCompleteMe
   python3 install.py --all
   ```

   对单个语言的编译请看[这里](#各语言编译)

## 各语言编译

### python

```bat
cd %USERPROFILE%\vimfiles\plugged\YouCompleteMe
python3 install.py
```

### C/C++

Compiling YCM **with** semantic support for C-family languages through **clangd**:

```bat
cd %USERPROFILE%\vimfiles\plugged\YouCompleteMe
python3 install.py --clangd-completer
```

Compiling YCM **without** semantic support for C-family languages:

```bat
cd %USERPROFILE%\vimfiles\plugged\YouCompleteMe
python3 install.py
```

### Others

The following additional language support options are available:

- C# support: add `--cs-completer` when calling `install.py`. Be sure that [the build utility `msbuild` is in your PATH](https://stackoverflow.com/questions/6319274/how-do-i-run-msbuild-from-the-command-line-using-windows-sdk-7-1).
- Go support: install [Go](https://golang.org/doc/install) and add `--go-completer` when calling `install.py`.
- JavaScript and TypeScript support: install [Node.js 18+ and npm](https://docs.npmjs.com/getting-started/installing-node#1-install-nodejs--npm) and add `--ts-completer` when calling `install.py`.
- Rust support: add `--rust-completer` when calling `install.py`.
- Java support: install [JDK 17](https://adoptium.net/en-GB/temurin/releases) and add `--java-completer` when calling `install.py`.

You can specify the Microsoft Visual C++ (MSVC) version using the `--msvc` option. YCM officially supports MSVC 15 (2017), MSVC 16 (Visual Studio 2019) and MSVC 17 (Visual Studio 17 2022).

# 参考

- [ycm-core官网](https://github.com/ycm-core/YouCompleteMe?tab=readme-ov-file#lsp-configuration)

> 补充: 设置代理
> - powershell: `$Env:http_proxy="http://127.0.0.1:7890";$Env:https_proxy="http://127.0.0.1:7890";$Env:all_proxy="http://127.0.0.1:7890"`
> - cmd: `set http_proxy="http://127.0.0.1:7890" & set https_proxy="http://127.0.0.1:7890" & set all_proxy="http://127.0.0.1:7890"`
> - 快捷获取: clash获取
