#!/bin/bash

case $1 in
  preinstall)
    touch $HOME/.zshrc_plug || true
    # oh my zsh
    rm -rf ~/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # vim
    rm -rf ~/.vim/* || true
    mkdir -p ~/.vim
    mkdir -p ~/.vim/bundle
    mkdir -p ~/.vim/autoload
    mkdir -p ~/.vim/colors

    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim         # curl pathogen into the just created folder
    # tmux
    rm -rf ~/.tmux/plugins/* || true
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm           # Install tmux plugin manager tpm
    
    rm -rf ~/.fzf || true
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    
    git clone https://github.com/sainnhe/sonokai ~/.vim/bundle/monokai
    # cp ~/.vim/bundle/monokai/autoload/ ~/.vim/autoload
    git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
    git clone https://github.com/neoclide/coc.nvim.git ~/.vim/bundle/coc.nvim --branch release
    git clone https://github.com/HerringtonDarkholme/yats.vim.git ~/.vim/bundle/yats
    git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
    git clone https://github.com/kshenoy/vim-signature ~/.vim/bundle/vim-signature
    git clone https://github.com/junegunn/fzf.git ~/.vim/bundle/fzf
    git clone https://github.com/junegunn/fzf.vim.git ~/.vim/bundle/fzf.vim
    git clone https://github.com/puremourning/vimspector ~/.vim/bundle/vimspector
    git clone https://github.com/editorconfig/editorconfig-vim ~/.vim/bundle/editorconfig
    git clone https://github.com/bling/vim-bufferline ~/.vim/bundle/vim-bufferline
    python -m pip install --user --upgrade pynvim

    rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/* || true
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
    ;;
  link)
    rm $HOME/.zshrc || true
    rm $HOME/.p10k.zsh || true
    rm $HOME/.tmux.conf || true
    rm $HOME/.vimrc || true
    rm $HOME/.doom.d/* || true
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then 
      # Install zsh configuration
      ln -P .zshrc $HOME/.zshrc
      ln -P .p10k.zsh $HOME/.p10k.zsh
      # Install tmux configuration
      ln -P .tmux.conf $HOME/.tmux.conf
      # Install vim configuration
      ln -P .vimrc $HOME/.vimrc

      ln -P ./doom/config.el $HOME/.doom.d/config.el
      ln -P ./doom/packages.el $HOME/.doom.d/packages.el
      ln -P ./doom/init.el $HOME/.doom.d/init.el
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      # Install zsh configuration
      ln -h .zshrc $HOME/.zshrc
      ln -h .p10k.zsh $HOME/.p10k.zsh
      # Install tmux configuration
      ln -h .tmux.conf $HOME/.tmux.conf
      # Install vim configuration
      ln -h .vimrc $HOME/.vimrc

      ln -h ./doom/config.el $HOME/.doom.d/config.el
      ln -h ./doom/packages.el $HOME/.doom.d/packages.el
      ln -h ./doom/init.el $HOME/.doom.d/init.el
    fi
    mkdir -p ~/.config/nvim
    cp ./init.vim ~/.config/nvim/
    ;;
esac
