#!/bin/bash

#Make sure we are in the same directory as install.sh
here="$( cd "$( dirname "$0" )" && pwd )"
cd $here

#Setup symlinks
if [[ -f .includes ]]; then
  files=`grep -v "^#" .includes`
else
  files=`find . -maxdepth 1 -type f -name "\.*"`
fi

for f in $files
do
  echo $f
  if [[ -f $f ]]; then
    if [[ $f != "install.sh" ]]; then
      ln -s `pwd`"/$f" $HOME/$f
    fi
  fi
done

if [ ! -f $HOME/.bash_profile ]; then
  source $HOME/.bash_profile
fi

if [ ! -d $HOME/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  . $HOME/.fzf/install
fi

if [ ! -d $HOME/.vim ]; then
  mkdir -p $HOME/.vim
fi

# Install Pathogen
if [ ! -f $HOME/.vim/autoload/pathogen.vim ]; then
  mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
  curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Install Vim Plugins

#Nerdtree
if [ ! -d $HOME/.vim/bundle/nerdtree ]; then
  git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle
fi

#Syntastic
if [ ! -d $HOME/.vim/bundle/syntastic ]; then
  git clone https://github.com/scrooloose/syntastic.git $HOME/.vim/bundle
fi

#Tagbar
if [ ! -d $HOME/.vim/bundle/tagbar ]; then
  git clone https://github.com/majutsushi/tagbar.git $HOME/.vim/bundle
fi

#Tlib
if [ ! -d $HOME/.vim/bundle/tlib_vim ]; then
  git clone https://github.com/tomtom/tlib_vim.git $HOME/.vim/bundle
fi

#TMUX Line
if [ ! -d $HOME/.vim/bundle/tmuxline.vim ]; then
  git clone https://github.com/edkolev/tmuxline.vim.git $HOME/.vim/bundle
fi

#utilisnips
if [ ! -d $HOME/.vim/bundle/ultisnips ]; then
  git clone https://github.com/SirVer/ultisnips.git $HOME/.vim/bundle
fi

#Vim Abolish
if [ ! -d $HOME/.vim/bundle/vim-abolish ]; then
  git clone https://github.com/tpope/vim-abolish.git $HOME/.vim/bundle
fi

#Vim Addon MW Uitls
if [ ! -d $HOME/.vim/bundle/vim-addon-mw-utils ]; then
  git clone https://github.com/MarcWeber/vim-addon-mw-utils.git $HOME/.vim/bundle
fi

#Vim Airline
if [ ! -d $HOME/.vim/bundle/vim-airline ]; then
  git clone https://github.com/vim-airline/vim-airline $HOME/.vim/bundle
fi

#Vim Better Whitespace
if [ ! -d $HOME/.vim/bundle/vim-better-whitespace ]; then
  git clone https://github.com/ntpeters/vim-better-whitespace.git $HOME/.vim/bundle
fi

#Vim Bootstrap3 Snippets
if [ ! -d $HOME/.vim/bundle/vim-bootstrap3-snippets ]; then
  git clone https://github.com/chrisgillis/vim-bootstrap3-snippets.git $HOME/.vim/bundle
fi

#Vim Bundler
if [ ! -d $HOME/.vim/bundle/vim-bundler ]; then
  git clone https://github.com/tpope/vim-bundler.git $HOME/.vim/bundle
fi

#Vim colors solarized
if [ ! -d $HOME/.vim/bundle/vim-colors-solarized ]; then
  git clone https://github.com/altercation/vim-colors-solarized.git $HOME/.vim/bundle
fi

#Vim Commentary
if [ ! -d $HOME/.vim/bundle/vim-commentary ]; then
  git clone https://github.com/tpope/vim-commentary.git $HOME/.vim/bundle
fi

#Vim Endwise
if [ ! -d $HOME/.vim/bundle/vim-endwise ]; then
  git clone https://github.com/tpope/vim-endwise.git $HOME/.vim/bundle
fi

#Vim Fugitive
if [ ! -d $HOME/.vim/bundle/vim-fugitive ]; then
  git clone https://github.com/tpope/vim-fugitive.git $HOME/.vim/bundle
fi

#Vim GitGutter
if [ ! -d $HOME/.vim/bundle/vim-gitgutter ]; then
  git clone https://github.com/airblade/vim-gitgutter.git $HOME/.vim/bundle
fi

#Vim Markdown
if [ ! -d $HOME/.vim/bundle/vim-markdown ]; then
  git clone https://github.com/plasticboy/vim-markdown.git $HOME/.vim/bundle
fi

#Vim Projectionist
if [ ! -d $HOME/.vim/bundle/vim-projectionist ]; then
  git clone https://github.com/tpope/vim-projectionist.git $HOME/.vim/bundle
fi

#Vim Rails
if [ ! -d $HOME/.vim/bundle/vim-rails ]; then
  git clone https://github.com/tpope/vim-rails.git $HOME/.vim/bundle
fi

#Vim Rake
if [ ! -d $HOME/.vim/bundle/vim-rake ]; then
  git clone https://github.com/tpope/vim-rake.git $HOME/.vim/bundle
fi

#Vim Repeat
if [ ! -d $HOME/.vim/bundle/vim-repeat ]; then
  git clone https://github.com/tpope/vim-repeat.git $HOME/.vim/bundle
fi

#Vim Sensible
if [ ! -d $HOME/.vim/bundle/vim-sensible ]; then
  git clone https://github.com/tpope/vim-sensible.git $HOME/.vim/bundle
fi

#Vim Snipmate
if [ ! -d $HOME/.vim/bundle/vim-snipmate ]; then
  git clone https://github.com/garbas/vim-snipmate.git $HOME/.vim/bundle
fi

#Vim Surround
if [ ! -d $HOME/.vim/bundle/vim-surround ]; then
  git clone https://github.com/tpope/vim-surround.git $HOME/.vim/bundle
fi

#Vim Tags
if [ ! -d $HOME/.vim/bundle/vim-tags ]; then
  git clone https://github.com/szw/vim-tags $HOME/.vim/bundle
fi

#Vim TBone
if [ ! -d $HOME/.vim/bundle/vim-tbone ]; then
  git clone https://github.com/tpope/vim-tbone.git $HOME/.vim/bundle
fi

#Vim Textobj rubyblock
if [ ! -d $HOME/.vim/bundle/vim-textobj-user ]; then
  git clone https://github.com/nelstrom/vim-textobj-rubyblock.git $HOME/.vim/bundle
fi

#VIm Textobj user
if [ ! -d $HOME/.vim/bundle/vim-textobj-user ]; then
  git clone https://github.com/kana/vim-textobj-user.git $HOME/.vim/bundle
fi

#Vim Unimpaired

#Yajs
if [ ! -d $HOME/.vim/bundle/yajs ]; then
  git clone https://github.com/othree/yajs.vim.git $HOME/.vim/bundle/yajs
fi

#You Complete Me
if [ ! -d $HOME/.vim/bundle/you-complete-me ]; then
  git clone https://github.com/Valloric/YouCompleteMe.git $HOME/.vim/bundle/you-complete-me && \
  cd $HOME/.vim/bundle/you-complete-me && \
  ./install.py --clang-completer --tern-completer
fi
