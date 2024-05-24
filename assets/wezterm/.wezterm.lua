local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'OneDark (base16)'

config.font = wezterm.font('JetBrains Mono', { weight = 'Regular', italic = false })
config.font_size = 15.0
-- 透明背景
config.window_background_opacity = 0.95
-- 取消 Windows 原生标题栏
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- 关闭时不进行确认
config.window_close_confirmation = 'NeverPrompt'
-- 滚动条尺寸为 15 ，其他方向不需要 pad
config.window_padding = { left = 0, right = 15, top = 0, bottom = 0 }
-- 启用滚动条
config.enable_scroll_bar = true

-- launch
config.default_prog = { 'cmd.exe' }     -- 默认启动 cmd
-- 启动菜单的一些启动项
config.launch_menu = {
  { label = 'MINGW64 / MSYS2', args = { 'C:/msys64/msys2_shell.cmd', '-defterm', '-here', '-no-start', '-shell', 'zsh', '-mingw64' }, },
  { label = 'MSYS / MSYS2',    args = { 'C:/msys64/msys2_shell.cmd', '-defterm', '-here', '-no-start', '-shell', 'zsh', '-msys' }, },
  { label = 'nas / ssh',       args = { 'C:/msys64/usr/bin/ssh.exe', 'nas' }, },
  { label = 'PowerShell',      args = { 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe' }, },
  { label = 'CMD',             args = { 'cmd.exe' }, },
}
-- config.default_cwd = '~'   -- launch path

-- 取消所有默认的热键
config.disable_default_key_bindings = true
local act = wezterm.action
config.keys = {
  { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },          -- Ctrl+Tab 向前遍历 tab
  { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },   -- Ctrl+Shift+Tab 向后遍历 tab
  { key = 'F11', mods = 'NONE', action = act.ToggleFullScreen },                -- F11 切换全屏
  -- { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },         -- Ctrl+Shift++ 字体增大
  { key = '_', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },            -- Ctrl+Shift+- 字体减小
  { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },          -- Ctrl+Shift+C 复制选中区域
  { key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },       -- Ctrl+Shift+V 粘贴剪切板的内容
  { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },                 -- Ctrl+Shift+N 新窗口
  { key = 'T', mods = 'SHIFT|CTRL', action = act.ShowLauncher },                -- Ctrl+Shift+T 新 tab
  { key = 'W', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = false } },                                  -- Ctrl+Shift+W 关闭 tab 且不进行确认
  { key = 'Enter', mods = 'SHIFT|CTRL', action = act.ShowLauncherArgs { flags = 'FUZZY|TABS|LAUNCH_MENU_ITEMS' } },     -- Ctrl+Shift+Enter 显示启动菜单
  { key = '"', mods = 'SHIFT|CTRL', action = act.SplitVertical {domain="CurrentPaneDomain"} },                          -- 沿垂直方向分屏
  { key = '|', mods = 'SHIFT|CTRL', action = act.SplitHorizontal {domain="CurrentPaneDomain"} },                        -- 沿水平方向分屏
  { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection "Left" },                                -- 激活左侧屏幕
  { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection "Right" },                              -- 激活右侧屏幕
  { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection "Up" },                                    -- 激活上侧屏幕
  { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection "Down" },                                -- 激活下侧屏幕
  -- { key = 'PageUp', mods = 'SHIFT|CTRL', action = act.ScrollByPage(-1) },       -- Ctrl+Shift+PageUp 向上滚动一页
  -- { key = 'PageDown', mods = 'SHIFT|CTRL', action = act.ScrollByPage(1) },      -- Ctrl+Shift+PageDown 向下滚动一页
  -- { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ScrollByLine(-1) },      -- Ctrl+Shift+UpArrow 向上滚动一行
  -- { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ScrollByLine(1) },     -- Ctrl+Shift+DownArrow 向下滚动一行
}

return config
