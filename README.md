<div align="center">
  <img align="center" width="350" src="https://github.com/mownos/nvimisty/blob/main/doc/nvimisty-logo.png" alt="logo" />
</div>

<br />
<p align="center">Customize IDE-like neovim config that is extensible and easy to use. </p>

> **Warning**  
> This config is not yet perfected and work in progress, so there may be some bugs, you can report it through [Issues](https://github.com/mownos/nvimisty/issues)

## 🌟 Preview
<img src="https://github.com/mownos/nvimisty/blob/main/doc/nvim-preview.png" />

## 📖 Features
- Full LSP support like diagnostic and code hints with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- Pretty editor color with [onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim)
- Integrate Copilot AI assistant with [copilot-lua](https://github.com/zbirenbaum/copilot.lua)
- User-friendly File explorer and rich directory icons with [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Customize tabline with [nvim-cokeline](https://github.com/willothy/nvim-cokeline)
- Formatted with [formatter.nvim](https://github.com/mhartington/formatter.nvim)
- Syntax highlighting with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Fuzz finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim) as finder for legendary.nvim and more
- Git integration with [git-blame.nvim](https://github.com/f-person/git-blame.nvim) and use [diffview.nvim](https://github.com/sindrets/diffview.nvim/issues) as git diff panel
- Beauty statusline with [windline.nvim](https://github.com/windwp/windline.nvim)
- Fantastic startup page with [veil.nvim](https://github.com/willothy/veil.nvim)
- Smooth scroll experience with [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)

**Thanks to the amazing Neovim community for making the above things possible! I can't imagine rolling my own IDE without Neovim community.**

## ⚡️ Requirements
- [Nerd fonts](https://www.nerdfonts.com/) for beautiful icons and editor font.
- [Lazygit](https://github.com/jesseduffield/lazygit) for git integration.
- [Git](https://git-scm.com/) dependent on some Neovim Git integrated plugins.

## Install
> **Warning**  
> I have defined a few keybinds with the (⌘)command key, the hotkey experience will be better if you use Mac OS. I use legendary to manage my hotkeys os if you are another 
 platform, you can update these keybinds via [/lua/plugins/configs/legendary-configs/legendary-nvim.lua](https://github.com/mownos/nvimisty/blob/main/lua/plugins/configs/legendary-configs/legendary-nvim.lua).

**Step1. Backup your current neovim config folder**
```shell
mv ~/.config/nvim ~/.config/nvim.bak
```

**Step2. Clone this repository as your neovim config**
```shell
git clone https://github.com/mownos/nvimisty ~/.config/nvim
```

**Step3. enjoy your editor!**
```shell
nvim
```
## Mappings
All key mappings and commands were defined in [/lua/plugins/configs/legendary-configs/legendary-nvim.lua](https://github.com/mownos/nvimisty/blob/main/lua/plugins/configs/legendary-configs/legendary-nvim.lua), press 
 `command + p` for list, , and you can update these keys anytime.

## LICENSE
MIT
  
