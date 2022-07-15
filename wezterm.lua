local wezterm = require 'wezterm';
local initial_cwd = "c:/dev/"

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
local function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
local SOLID_LEFT_MOST = utf8.char(0x2588)
local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)

local ADMIN_ICON = utf8.char(0xf49c)
local VIM_ICON = utf8.char(0xe62b)
local CMD_ICON = utf8.char(0xe62a)
local PS_ICON = utf8.char(0xe70f)
local HOURGLASS_ICON = utf8.char(0xf252)

local SUP_IDX = {"¹","²","³","⁴","⁵","⁶","⁷","⁸","⁹","¹⁰",
                 "¹¹","¹²","¹³","¹⁴","¹⁵","¹⁶","¹⁷","¹⁸","¹⁹","²⁰"}
local SUB_IDX = {"₁","₂","₃","₄","₅","₆","₇","₈","₉","₁₀",
                 "₁₁","₁₂","₁₃","₁₄","₁₅","₁₆","₁₇","₁₈","₁₉","₂₀"}

local uname = os.getenv("username") .. "@" .. os.getenv("computername")
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local edge_background = "#121212"
  local background = "#4E4E4E"
  local foreground = "#1C1B19"
  local dim_foreground = "#3A3A3A"

  if tab.is_active then
    background = "#FBB829"
    foreground = "#1C1B19"
  elseif hover then
    background = "#FF8700"
    foreground = "#1C1B19"
  end

  local edge_foreground = background
  local process_name = tab.active_pane.foreground_process_name
  local pane_title = tab.active_pane.title
  local exec_name = basename(process_name):gsub("%.exe$", "")
  local title_with_icon

  if exec_name == "cmd" then
    title_with_icon = CMD_ICON .. " CMD"
  elseif exec_name == "pwsh" then
    title_with_icon = PS_ICON .. " PS"
  else
    title_with_icon = HOURGLASS_ICON .. " " .. exec_name
  end

  if pane_title:match("^Administrator: ") then
    title_with_icon = title_with_icon .. " " .. ADMIN_ICON
  end

  local left_arrow = SOLID_LEFT_ARROW

  if tab.tab_index == 0 then
    left_arrow = SOLID_LEFT_MOST
  end
  local id = SUB_IDX[tab.tab_index+1]
  local pid = SUP_IDX[tab.active_pane.pane_index+1]
  local title = " " .. wezterm.truncate_right(title_with_icon, max_width-6) .. " "

  return {
    {Attribute={Intensity="Bold"}},
    {Background={Color=edge_background}},
    {Foreground={Color=edge_foreground}},
    {Text=left_arrow},
    {Background={Color=background}},
    {Foreground={Color=foreground}},
    {Text=id},
    {Text=title},
    {Foreground={Color=dim_foreground}},
    {Text=pid},
    {Background={Color=edge_background}},
    {Foreground={Color=edge_foreground}},
    {Text=SOLID_RIGHT_ARROW},
    {Attribute={Intensity="Normal"}},
  }
end)


return {
   -- default_prog = {"C:/tools/neovim/Neovim/bin/nvim.exe","."},
   -- disable_default_key_bindings = true,
   set_environment_variables = {
    prompt = "┌($E[34m" .. uname:lower() .. "$E[0m)─[$E[32m$P$E[0m]$_└─$E[34m$$$E[0m",
    LANG = "en_US.UTF-8",

	-- PATH = "c:\include_path\;" .. os.getenv("PATH"),
   },   
   -- leader = { key="`"},
   leader = { key="a",mods="CTRL"},
   disable_default_key_bindings = true,
   default_cwd = initial_cwd,
   window_padding = {
            left = 6,
            right = 2,
            top = 0,
            bottom = 0,
    },
   -- https://wezfurlong.org/wezterm/config/default-keys.html
   keys = {
	   -- create new tab pane
      {key="l", mods="ALT",action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
      {key="j", mods="ALT",action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},

	  -- switch between tabs
      {key="Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
      {key="Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},

	  -- close a tab / window
	  -- {key="`", mods="LEADER",action=wezterm.action{CloseCurrentPane={confirm=false}}},
	  {key="F10", mods="",action=wezterm.action{CloseCurrentPane={confirm=false}}},
	  {key="F11", mods="",action=wezterm.action{SpawnCommandInNewTab={
          -- cwd = initial_cwd
	  }}},
      -- paste from the clipboard
      {key="V", mods="CTRL", action=wezterm.action{PasteFrom="Clipboard"}},

	  -- navigate between tabs using vim keys
		{ key = "h", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Left"}},
		{ key = "l", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Right"}},
		{ key = "k", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Up"}},
		{ key = "j", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Down"}},

	 -- resize tab window using vim keys
	    { key = "h", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
		{ key = "j", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
		{ key = "k", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
		{ key = "l", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Right", 15}}},

     -- Set default key for font size shortcuts
        {key="F7", mods="", action="DecreaseFontSize"},
        {key="F8", mods="", action="IncreaseFontSize"},

	 -- switch to full screen 
        {key="F12", mods="", action="ToggleFullScreen"},

        {key="1", mods="ALT", action=wezterm.action{ActivateTab=0}},
        {key="2", mods="ALT", action=wezterm.action{ActivateTab=1}},
        {key="3", mods="ALT", action=wezterm.action{ActivateTab=2}},
        {key="4", mods="ALT", action=wezterm.action{ActivateTab=3}},
        {key="5", mods="ALT", action=wezterm.action{ActivateTab=4}},
        {key="6", mods="ALT", action=wezterm.action{ActivateTab=5}},
        {key="7", mods="ALT", action=wezterm.action{ActivateTab=6}},
        {key="8", mods="ALT", action=wezterm.action{ActivateTab=7}},
        {key="9", mods="ALT", action=wezterm.action{ActivateTab=8}},
        {key="0", mods="ALT", action=wezterm.action{ActivateTab=-1}},
   },
   initial_rows = 45,
   initial_cols = 104,
   line_height = 1.2,
   -- font_dirs = {"C:/Windows/Fonts"},
   font_shaper = "Harfbuzz",  -- "Allsorts", Harfbuzz
   font_size = 10.0,
   font_rasterizer = "FreeType",
   font_antialias = "Greyscale",  -- None, Grayscale, Subpixel
   font_hinting = "Full",  -- None, Vertical, VerticalSubpixel, Full
   -- font = wezterm.font("OperatorMono Nerd Font", {weight=325, stretch="Normal", italic=false}),
   -- font = wezterm.font("OperatorMono Nerd Font", {weight="DemiLight", stretch="Normal", italic=false}),
   -- font = wezterm.font("OperatorMono Nerd Font", {weight=275, stretch="Normal", italic=false}),
   -- font = wezterm.font("OperatorMono Nerd Font", {weight="Regular", stretch="Normal", italic=false}),
   -- font = wezterm.font("JetBrainsMono NF", {weight="Regular", stretch="Normal", italic=false}),
   -- font = wezterm.font("JetBrainsMonoMedium NF", {weight="Medium", stretch="Normal", italic=false}),
   -- font = wezterm.font("SauceCodePro NF", {weight="Regular", stretch="Normal", italic=false}),
   -- font = wezterm.font("SauceCodePro Nerd Font Mono", {weight="Regular", stretch="Normal", italic=false}),
   -- font = wezterm.font("SauceCodePro Nerd Font Mono", {weight="Regular", stretch="Normal", italic=false}),
   -- font = wezterm.font("JetBrainsMonoExtraBold Nerd Font Mono", {weight="ExtraBold", stretch="Normal", italic=false}),
   font = wezterm.font("SFMono Nerd Font", {weight="DemiBold", stretch="Normal", style="Normal"}),
   -- font = wezterm.font("SFMono Nerd Font", {weight="Medium", stretch="Normal", style="Normal"}),
   -- font = wezterm.font("CamingoCode Nerd Font", {weight="Regular", stretch="Normal", style="Normal"}),
   -- font = wezterm.font("CamingoCode Nerd Font", {weight="Bold", stretch="Normal", style="Normal"}),
   -- color_scheme = "Builtin Solarized Dark",
   -- color_scheme = "Obsidian",
   -- color_scheme = "Gruvbox Dark",
   -- color_scheme = "OneHalfDark",
   -- color_scheme = "Batman",
   color_scheme = "Dracula",
   -- color_scheme = default_color_scheme,

   default_cursor_style = "BlinkingUnderline", -- SteadyBlock, SteadyBar, BlinkingBlock,
              -- BlinkingBar, SteadyUnderline, BlinkingUnderline
   scrollback_lines = 12000,
   selection_word_boundary = " \t\n[]\"'`(),.;:",  -- Default: " \t\n{}[]()\"'`",
   adjust_window_size_when_changing_font_size = false,
   enable_tab_bar = true,
   enable_scroll_bar = false,
   hide_tab_bar_if_only_one_tab = true,
   tab_max_width = 32,
  -- image background enable start ----------------------------- 
  --  window_background_opacity = 1.0,
  --  window_background_image = "c:/tools/wallpapers/img46.jpg",
  --  window_background_image_hsb = {
  --   brightness = 1.0,
  --   -- brightness = 0.5,
  --   -- brightness = 0.3,
  --   -- brightness = 0.1,
  --   -- brightness = 0.04,
  --   hue = 1.0,
  --   saturation = 1.0,
  -- },
  -- image background enable end -------------------------------
}
