sudo apt-get install ctags
sudo apt-get install silversearcher-ag
 sudo apt-get install ripgrep

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

echo -e "\e[92m Installing zsh\e[39m"
sudo apt-get -y install zsh.

echo -e '\e[92m Defining zsh as default shell (You need to re-login to make it work)\e[39m'
chsh -s $(which zsh)

#echo -e '\e[Copying .zshrc file\e[39m'
#cp $SCRIPTPATH/zshrc ~/.zshrc

FZF_REPO_DIR=fzf
if [ -d "$FZF_REPO_DIR" ]; then
    echo -e '\e[92m Deleting fzf repo directory\e[39m'
    sudo rm -r $FZF_REPO_DIR
fi

FZF_DIR=~/.fzf
if [ -d "$FZF_DIR" ]; then
    echo -e '\e[92m Deleting fzf directory\e[39m'
    sudo rm -r $FZF_DIR
fi

echo -e '\e[92m Installing vundle\e[39m'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
echo -e '\e[92m Installing fzf\e[39m'
~/.fzf/install --all

echo -e '\e[92m Installing Vim-Plug\e[39m'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

VIM_COLOR_DIR=~/.vim/colors/
echo -e '\e[92m Creating vim color directory\e[39m'
sudo mkdir $VIM_COLOR_DIR

DRACULA_REPO_DIR=/tmp/vim
if [ -d "$DRACULA_REPO_DIR" ]; then
    echo -e '\e[92m Deleting dracula repo directory\e[39m'
    sudo rm -r $DRACULA_REPO_DIR
fi

git clone https://github.com/dracula/vim.git $DRACULA_REPO_DIR

echo -e '\e[92m Copying dracula theme\e[39m'
sudo cp $DRACULA_REPO_DIR/colors/*.vim $VIM_COLOR_DIR

echo -e '\e[92m Copying .vimrc file\e[39m'
cp $SCRIPTPATH/vimrc ~/.vimrc

echo -e '\e[92m Installing Vim plugins\e[39m'
vim +PlugInstall +qall

echo -e '\e[92m Installing oh My zsh \e[39m'
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

sudo cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
source ~/.zshrc

