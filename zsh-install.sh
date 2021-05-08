#!/bin/bash                                                                                                                                                                                                        

#
# Setup Zsh environment
#
# Steps:
#   Reference: https://gist.github.com/OndrejValenta/41c4c60f837ccd56c57ba496177676b3
#   Installation steps for CentOS 7
#   1. Zsh
#   2. Oh-my-zsh
#   3. zsh-sytax-highlighting
#   4. zsh-history-substring-search
#   5. zsh-autosuggestions
#


if cat /etc/*release | grep ^NAME | grep CentOS; then
     echo "==============================================="
     echo "OS is CentOS"
     echo "==============================================="
     echo "Install zsh "
     # Install Zsh
     yum -y install zsh
     chsh -s /bin/zsh $USER
     echo $SHELL

     # Install Oh-my-zsh
     #   Zsh customization framework to use themes
     #   https://github.com/zsh-users/zsh-syntax-highlighting
     yum install wget git

elif cat /etc/*release | grep ^NAME | grep Ubuntu; then
     echo "==============================================="
     echo "OS is Ubuntu"
     echo "==============================================="
     echo "Install zsh "
     apt update 
     apt -y inatall zsh 
     chsh -s /bin/zsh $USER
     echo $SHELL
else 
    echo "OS is not support!!"
    exit 1
fi




# wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -I - | zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
source ~/.zshrc

# Install Powerline font
#   Font for display symbols
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
fc-cache -fv
# mv 10-powerline-symbols.conf /etc/fonts/conf.d/

# Install zsh-syntax-highlighting
#   Command line syntax highlighting
# edit .zshrc find "plugins" add "zsh-syntax-highlighting" into plugins=() as below:
#   vim ~/.zshrc
#   plugins=( git zsh-syntax-highlighting )
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh-substring-search
#   https://github.com/zsh-users/zsh-history-substring-search
# edit .zshrc find "plugins" > add "history-substring-search" into plugins=() as below:
#   vim ~/.zshrc
#   plugins=( git history-substring-search )
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Install zsh-autosuggestions
#   https://github.com/zsh-users/zsh-autosuggestions
# edit .zshrc find "plugins" add "zsh-autosuggestions" into plugins=() as below:
#   vim ~/.zshrc
#   plugins=( git zsh-autosuggestions )
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
 