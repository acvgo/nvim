# 💤 LazyVim-Neovim Config

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).  
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.  

## CHECK THE DOCUMENTATION!
Instructions for requirements can be found.  

### For installing font (presumes Debian/Ubuntu):
To install nerd/powerline fonts on Linux Debian/Ubuntu  
install font manager  
`sudo apt -y install font-manager`  

- Need to review below - 
install powerline fonts
`sudo apt install fonts-powerline`
- Need to review above -  

grab nerd/powerline-patched font (ie droid mono) from website and unpack  
You can see list at https://www.nerdfonts.com/font-downloads  
Open Fonts manager and find font download and install  
Set terminal to use font under Edit -> Profile Preferences  

## Keymaps
WIP - these are resources for the default configuration  
https://www.lazyvim.org/Keymaps  
https://www.lazyvim.org/configuration/general#Keymaps  


### Requires
Neovim >= 0.10.2 (current config testing w/ 0.10.2)  
Git >= 2.19.0  
For treesitter, you'll need a c compiler but if you are building  
neovim from source, you'll already have this.  
fzf - Fuzzy Finder is the replacement for telescope.  


### Installing supplementals/optionals
Lazygit - https://github.com/jesseduffield/lazygit  

For telescope:  
live grep (ripgrep) - https://github.com/BurntSushi/ripgrep  
`brew install ripgrep`

find files - https://github.com/sharkdp/fd  
`brew install fd`  

fzf - https://github.com/junegunn/fzf  
`brew install fzf`  

### To Add Python Neovim module
`sudo apt install python3-neovim`  
