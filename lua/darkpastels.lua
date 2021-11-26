-- Name:            darkpastels
-- Description:     Dark color scheme inspired by Konsole's Dark Pastels theme
-- Author:          Alex Fikl <alexfikl@gmail.com>
-- Website:         https://github.com/alexfikl/darkpastels.nvim
-- License:         MIT

-- {{{ notes and todos

-- XXX
-- * Code structure inspired by
-- https://github.com/glepnir/zephyr-nvim/blob/main/lua/zephyr.lua
-- * Colors taken from konsole at
-- https://invent.kde.org/utilities/konsole/-/blob/master/data/color-schemes/DarkPastels.colorscheme

-- TODO
-- * Support other plugins besides treesitter?

-- }}}

-- {{{ colors

local darkpastels = {
    -- names follow Konsole naming exactly
    -- NOTE: `Intense` colors are also set as bold
    Background          = '#2c2c2c';
    BackgroundIntense   = '#2c2c2c';
    BackgroundFaint     = '#2c2c2c';

    Color0              = '#3f3f3f';
    Color0Intense       = '#709080';
    Color0Faint         = '#343434';

    Color1              = '#705050';
    Color1Intense       = '#dca3a3';
    Color1Faint         = '#664848';

    Color2              = '#60b48a';
    Color2Intense       = '#71d5a3';
    Color2Faint         = '#57a37c';

    Color3              = '#dfaf8f';
    Color3Intense       = '#f0dfaf';
    Color3Faint         = '#aa856f';

    Color4              = '#9ab8d7';
    Color4Intense       = '#94bff3';
    Color4Faint         = '#758da1';

    Color5              = '#dc8cc3';
    Color5Intense       = '#ec93d3';
    Color5Faint         = '#9a6289';

    Color6              = '#8cd0d3';
    Color6Intense       = '#93e0e3';
    Color6Faint         = '#6b9fa1';

    Color7              = '#dcdccc';
    Color7Intense       = '#ffffff';
    Color7Faint         = '#95958b';

    Foreground          = '#dcdccc';
    ForegroundIntense   = '#dcdccc';
    ForegroundFaint     = '#dcdccc';

    none                = 'NONE';
}

-- add nicer names to colors
darkpastels.bg          = darkpastels.Background
darkpastels.fg          = darkpastels.Foreground
-- normal colors
darkpastels.black       = darkpastels.Color0
darkpastels.red         = darkpastels.Color1
darkpastels.green       = darkpastels.Color2
darkpastels.yellow      = darkpastels.Color3
darkpastels.blue        = darkpastels.Color4
darkpastels.purple      = darkpastels.Color5
darkpastels.cyan        = darkpastels.Color6
darkpastels.white       = darkpastels.Color7
-- bright colors
darkpastels.bblack      = darkpastels.Color0Intense
darkpastels.bred        = darkpastels.Color1Intense
darkpastels.bgreen      = darkpastels.Color2Intense
darkpastels.byellow     = darkpastels.Color3Intense
darkpastels.bblue       = darkpastels.Color4Intense
darkpastels.bpurple     = darkpastels.Color5Intense
darkpastels.bcyan       = darkpastels.Color6Intense
darkpastels.bwhite      = darkpastels.Color7Intense


-- }}}

--- {{{ helpers

function darkpastels.terminal_color()
    vim.g.terminal_color_0 = darkpastels.black
    vim.g.terminal_color_1 = darkpastels.red
    vim.g.terminal_color_2 = darkpastels.green
    vim.g.terminal_color_3 = darkpastels.yellow
    vim.g.terminal_color_4 = darkpastels.blue
    vim.g.terminal_color_5 = darkpastels.purple
    vim.g.terminal_color_6 = darkpastels.cyan
    vim.g.terminal_color_7 = darkpastels.white
    vim.g.terminal_color_8 = darkpastels.bblack
    vim.g.terminal_color_9 = darkpastels.bred
    vim.g.terminal_color_10 = darkpastels.bgreen
    vim.g.terminal_color_11 = darkpastels.byellow
    vim.g.terminal_color_12 = darkpastels.bblue
    vim.g.terminal_color_13 = darkpastels.bpurple
    vim.g.terminal_color_14 = darkpastels.bcyan
    vim.g.terminal_color_15 = darkpastels.bwhite
end

function darkpastels.highlight(group, color)
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
    local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
    local sp = color.sp and 'guisp=' .. color.sp or ''

    vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp)
end

-- }}}

-- {{{ define theme

function darkpastels.load_syntax()
    local syntax = {
        Normal          = { fg=darkpastels.fg, bg=darkpastels.bg };
        Terminal        = { fg=darkpastels.fg, bg=darkpastels.bg };
        SignColumn      = { fg=darkpastels.fg, bg=darkpastels.bg };
        FoldColumn      = { fg=darkpastels.fg_alt, bg=darkpastels.black };
        VertSplit       = { fg=darkpastels.black,bg=darkpastels.bg };
        Folded          = { fg=darkpastels.grey,bg=darkpastels.bg_highlight };
        EndOfBuffer     = { fg=darkpastels.bg, bg=darkpastels.none };
        IncSearch       = { fg=darkpastels.bg1, bg=darkpastels.orange, style=darkpastels.none };
        Search          = { fg=darkpastels.bg,bg=darkpastels.orange};
        ColorColumn     = { fg=darkpastels.none,bg=darkpastels.bg_highlight};
        Conceal         = { fg=darkpastels.grey,bg=darkpastels.none};
        Cursor          = { fg=darkpastels.none,bg=darkpastels.none,style='reverse'};
        vCursor         = { fg=darkpastels.none,bg=darkpastels.none,style='reverse'};
        iCursor         = { fg=darkpastels.none,bg=darkpastels.none,style='reverse'};
        lCursor         = { fg=darkpastels.none,bg=darkpastels.none,style='reverse'};
        CursorIM        = { fg=darkpastels.none,bg=darkpastels.none,style='reverse'};
        CursorColumn    = { fg=darkpastels.none,bg=darkpastels.bg_highlight};
        CursorLine      = { fg=darkpastels.none,bg=darkpastels.bg_highlight};
        LineNr          = { fg=darkpastels.base4};
        qfLineNr        = { fg=darkpastels.cyan};
        CursorLineNr    = { fg=darkpastels.blue};
        DiffAdd         = { fg=darkpastels.black,bg=darkpastels.dark_green};
        DiffChange      = { fg=darkpastels.black,bg=darkpastels.yellow};
        DiffDelete      = { fg=darkpastels.black,bg=darkpastels.red};
        DiffText        = { fg=darkpastels.black,bg=darkpastels.fg};
        Directory       = { fg=darkpastels.blue,bg=darkpastels.none};
        ErrorMsg        = { fg=darkpastels.red,bg=darkpastels.none,style='bold'};
        WarningMsg      = { fg=darkpastels.yellow,bg=darkpastels.none,style='bold'};
        ModeMsg         = { fg=darkpastels.fg,bg=darkpastels.none,style='bold'};
        MatchParen      = { fg=darkpastels.red,bg=darkpastels.none};
        NonText         = { fg=darkpastels.bg1};
        Whitespace      = { fg=darkpastels.base4};
        SpecialKey      = { fg=darkpastels.bg1};
        Pmenu           = { fg=darkpastels.fg,bg=darkpastels.bg_popup};
        PmenuSel        = { fg=darkpastels.base0,bg=darkpastels.blue};
        PmenuSelBold    = { fg=darkpastels.base0,g=darkpastels.blue};
        PmenuSbar       = { fg=darkpastels.none,bg=darkpastels.base4};
        PmenuThumb      = { fg=darkpastels.violet,bg=darkpastels.light_green};
        WildMenu        = { fg=darkpastels.fg,bg=darkpastels.green};
        Question        = { fg=darkpastels.yellow};
        NormalFloat     = { fg=darkpastels.base8,bg=darkpastels.bg_highlight};
        Tabline         = { fg=darkpastels.base6,bg=darkpastels.base2};
        TabLineFill     = { style=darkpastels.none};
        TabLineSel      = { fg=darkpastels.fg,bg=darkpastels.blue};
        StatusLine      = { fg=darkpastels.base8,bg=darkpastels.base2,style=darkpastels.none};
        StatusLineNC    = { fg=darkpastels.grey,bg=darkpastels.base2,style=darkpastels.none};
        SpellBad        = { fg=darkpastels.red,bg=darkpastels.none,style='undercurl'};
        SpellCap        = { fg=darkpastels.blue,bg=darkpastels.none,style='undercurl'};
        SpellLocal      = { fg=darkpastels.cyan,bg=darkpastels.none,style='undercurl'};
        SpellRare       = { fg=darkpastels.violet,bg=darkpastels.none,style = 'undercurl'};
        Visual          = { fg=darkpastels.black,bg=darkpastels.bg_visual};
        VisualNOS       = { fg=darkpastels.black,bg=darkpastels.bg_visual};
        QuickFixLine    = { fg=darkpastels.violet,style='bold'};
        Debug           = { fg=darkpastels.orange};
        debugBreakpoint = { fg=darkpastels.bg,bg=darkpastels.red};

        Boolean = {fg=darkpastels.orange};
        Number = {fg=darkpastels.brown};
        Float = {fg=darkpastels.brown};
        PreProc = {fg=darkpastels.violet};
        PreCondit = {fg=darkpastels.violet};
        Include = {fg=darkpastels.violet};
        Define = {fg=darkpastels.violet};
        Conditional = {fg=darkpastels.magenta};
        Repeat = {fg=darkpastels.magenta};
        Keyword = {fg=darkpastels.green};
        Typedef = {fg=darkpastels.red};
        Exception = {fg=darkpastels.red};
        Statement = {fg=darkpastels.red};
        Error = {fg=darkpastels.red};
        StorageClass = {fg=darkpastels.orange};
        Tag = {fg=darkpastels.orange};
        Label = {fg=darkpastels.orange};
        Structure = {fg=darkpastels.orange};
        Operator = {fg=darkpastels.redwine};
        Title = {fg=darkpastels.orange,style='bold'};
        Special = {fg=darkpastels.yellow};
        SpecialChar = {fg=darkpastels.yellow};
        Type = {fg=darkpastels.teal};
        Function = {fg=darkpastels.yellow};
        String = {fg=darkpastels.light_green};
        Character = {fg=darkpastels.green};
        Constant = {fg=darkpastels.cyan};
        Macro = {fg=darkpastels.cyan};
        Identifier = {fg=darkpastels.blue};

        Comment = {fg=darkpastels.base6};
        SpecialComment = {fg=darkpastels.grey};
        Todo = {fg=darkpastels.violet};
        Delimiter = {fg=darkpastels.fg};
        Ignore = {fg=darkpastels.grey};
        Underlined = {fg=darkpastels.none,style='underline'};

        DashboardShortCut = {fg=darkpastels.magenta};
        DashboardHeader = {fg=darkpastels.orange};
        DashboardCenter = {fg=darkpastels.cyan};
        DashboardFooter = {fg=darkpastels.yellow,style='bold'};
    }
    return syntax
end

-- }}}

-- {{{ define theme for plugins

function darkpastels.load_plugin_syntax()
end

-- }}}

-- {{{ load plugin

local async_load_plugin

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function ()
    darkpastels.terminal_color()

    local syntax = darkpastels.load_plugin_syntax()
    for group, colors in pairs(syntax) do
        darkpastels.highlight(group, colors)
    end

    async_load_plugin:close()
end))

function darkpastels.colorscheme()
    vim.api.nvim_command('hi clear')

    if vim.fn.exists('syntax_on') then
        vim.api.nvim_command('syntax reset')
    end

    vim.o.background = 'dark'
    vim.o.termguicolors = true
    vim.g.colors_name = 'darkpastels'

    local syntax = darkpastels.load_syntax()
    for group, colors in pairs(syntax) do
        darkpastels.highlight(group, colors)
    end

    async_load_plugin:send()
end

darkpastels.colorscheme()

-- }}}

return darkpastels
