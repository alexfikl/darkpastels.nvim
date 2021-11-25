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
    color0          = '#3f3f3f';
    color1          = '#705050';
    color2          = '#60b48a';
    color3          = '#dfaf7c';
    color4          = '#9ab8d7';
    color5          = '#dc8cc3';
    color6          = '#8cd0d3';
    color7          = '#dcdccc';

    bg              = '#2c2c2c';
    fg              = '#dcdccc';

    red             = '#dca3a3';
    green           = '#709080';
    green_intense   = '#72d5a3'
    yellow          = '';
    blue            = '';
    purple          = '';
    cyan            = '';
    white           = '';

    none            = 'NONE';
}

-- }}}

--- {{{ helpers

function darkpastels.terminal_color()
    vim.g.terminal_color_0 = darkpastels.bg
    vim.g.terminal_color_1 = darkpastels.red
    vim.g.terminal_color_2 = darkpastels.green
    vim.g.terminal_color_3 = darkpastels.yellow
    vim.g.terminal_color_4 = darkpastels.blue
    vim.g.terminal_color_5 = darkpastels.violet
    vim.g.terminal_color_6 = darkpastels.cyan
    vim.g.terminal_color_7 = darkpastels.bg1
    vim.g.terminal_color_8 = darkpastels.brown
    vim.g.terminal_color_9 = darkpastels.red
    vim.g.terminal_color_10 = darkpastels.green
    vim.g.terminal_color_11 = darkpastels.yellow
    vim.g.terminal_color_12 = darkpastels.blue
    vim.g.terminal_color_13 = darkpastels.violet
    vim.g.terminal_color_14 = darkpastels.cyan
    vim.g.terminal_color_15 = darkpastels.fg
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
