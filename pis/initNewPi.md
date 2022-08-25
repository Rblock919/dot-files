# Commands to initialize a new pi

```bash
# Set term so that typing works correctly over ssh
export TERM=xterm

# Install initial dependencies
sudo apt install wget curl git vim ripgrep

# Install nodejs
curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt install nodejs gcc g++ make

sudo apt install zsh
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install & build neovim from source
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

cd
git clone https://github.com/Rblock919/dot-files.git

sudo apt install fzf
wget https://github.com/sharkdp/bat/releases/download/v0.21.0/bat_0.21.0_arm64.deb
sudo dpkg -i bat_0.21.0_arm64.deb

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install vim-plugged
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir ~/.config/nvim
cp dot-files/vim/init.vim ~/.config/nvim/init.vim

nvim ~/dot-files/vim/vimTips.txt # and then run :PlugInstall
# Now run all the :CocInstall commands listed in file

wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
cd zsh-master
cp dracula.zsh-theme ~/.oh-my-zsh/themes
cp -r lib/ ~/.oh-my-zsh/themes

cd

cp dot-files/bash/zshrc .zshrc
nvim .zshrc # then remove what isn't needed and add back in export TERM=xterm

cp ~/dot-files/bash/bash_aliases ~/.bash_aliases # update ip addresses if dot-files hasn't already
cp ~/dot-files/bash/git_functions ~/.git_functions
source .zshrc
```

```bash
# To assign external drives to directories on startup
UUID=155ddd29-a974-43b2-a6d2-b0bb3d729f0a /home/pi/share/HDD320 ext4 defaults,nofail 0 0
UUID=de405eb5-2b76-44e3-b54e-82d9bf38e339 /home/pi/share/HDD160 ext4 defaults,nofail 0 0
```
