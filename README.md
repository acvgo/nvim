# 💤 LazyVim-Neovim Config

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).  
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.  

## CHECK THE DOCUMENTATION!
Instructions for requirements can be found.  

### For installing font (presumes Debian/Ubuntu):
To install nerd/powerline fonts on machines running Linux Debian/Ubuntu  
-Install font manager  
`sudo apt -y install font-manager`  

For all terminals  
-Grab nerd/powerline-patched font (ie droid mono) from website and unpack  
-You can see list at https://www.nerdfonts.com/font-downloads  
For Linux  
-Open Fonts manager or and find font download and install  
For Windows/WSL  
-Double click on the font  
Then set the font as active in the terminal  
-Set terminal to use font under Edit -> Profile Preferences  

## Keymaps
WIP - these are resources for the default configuration  
https://www.lazyvim.org/Keymaps  
https://www.lazyvim.org/configuration/general#Keymaps  


### Requires
Neovim >= 0.11 (current config testing w/ 0.11.1)  
Git >= 2.19.0  
For treesitter, you'll need a c compiler but if you are building neovim from source, you'll already have this.  
(fzf - Fuzzy Finder is the replacement for telescope so this really should be considered required. However, if you are  
using Copilot, it requires telescope still.)  


### Recommended
[homebrew](https://brew.sh/) - This is good for easy install of the supplemental below  
Node and NPM - any JS work will require these and this config presumes JS is a burden you bear in your life.  
`sudo apt install nodejs npm -y`


### Installing supplemental/optional additions
Lazygit - https://github.com/jesseduffield/lazygit  
`brew install lazygit`

live grep (ripgrep) - https://github.com/BurntSushi/ripgrep  
`brew install ripgrep`

find files - https://github.com/sharkdp/fd  
`brew install fd`  

fzf - https://github.com/junegunn/fzf  
`brew install fzf`  

### To Add Python Neovim module
`sudo apt install python3-neovim`  


## To Install Neovim from source (for Debian/Ubuntu)
Install prerequisites  
`sudo apt-get install ninja-build gettext cmake curl build-essential`  
Grab Sauce  
`cd ~ && git clone https://github.com/neovim/neovim`  
Build and Install  
`cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=Release && cd build && cpack -G DEB && sudo dpkg -i nvim-linux-*.deb`  
this will (1) move into the cloned code, (2) change your branch to 'stable', (3) initiate a 'release' build, (4) move into the build directory, (5) package the build as a DEB file, and (6) then use Debian's package tool (dpkg) to install neovim on the system. This has the benefit of registering the application w/ dpkg and makes future version upgrades easily replaced without extra action.  
Finally, remove the repo  
`cd ~ && rm -rf neovim`  


## To Run Copilot  
Enter Insert Mode to get Copilot  
`:Copilot auth`
Once authenticated, you can check with  
`:Copilot status`
Other commands and documentation can be found at lua/docs/copilot.txt 
