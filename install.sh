SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

echo -e "\e[92mInstalling zsh\e[39m"
sudo apt-get -y install zsh.

echo -e '\e[92mDefining zsh as default shell (You need to re-login to make it work)\e[39m'
chsh -s $(which zsh)

echo -e '\e[Copying .zshrc file\e[39m'
cp $SCRIPTPATH/zshrc ~/.zshrc

FZF_REPO_DIR=fzf
if [ -d "$FZF_REPO_DIR" ]; then
    echo -e '\e[92mDeleting fzf repo directory\e[39m'
    sudo rm -r $FZF_REPO_DIR
fi

FZF_DIR=~/.fzf
if [ -d "$FZF_DIR" ]; then
    echo -e '\e[92mDeleting fzf directory\e[39m'
    sudo rm -r $FZF_DIR
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
echo -e '\e[92mInstalling fzf\e[39m'
~/.fzf/install --all

echo -e '\e[92mInstalling Vim-Plug\e[39m'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

VIM_COLOR_DIR=~/.vim/colors
if ![ -d "$VIM_COLOR_DIR" ]; then
    echo -e '\e[92mcreating vim color directory\e[39m'
    sudo rm -r $VIM_COLOR_DIR
fi

DRACULA_REPO_DIR=/tmp/vim
if [ -d "$DRACULA_REPO_DIR" ]; then
    echo -e '\e[92mDeleting dracula repo directory\e[39m'
    sudo rm -r $DRACULA_REPO_DIR
fi

git clone https://github.com/dracula/vim.git $DRACULA_REPO_DIR

echo -e '\e[Copying dracula theme\e[39m'
cp $DRACULA_REPO_DIR/colors/*.vim $VIM_COLOR_DIR

echo -e '\e[Copying .vimrc file\e[39m'
cp $SCRIPTPATH/vimrc ~/.vimrc

echo -e '\e[Installing Vim plugins\e[39m'
vim +PlugInstall +qall