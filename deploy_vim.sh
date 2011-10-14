mkdir vimfiles/.vim
git clone git://github.com/msanders/snipmate.vim.git
cp -rf snipmate.vim/* vimfiles/.vim/
git clone https://github.com/scrooloose/nerdtree.git
cp -rf nerdtree/* vimfiles/.vim/

rm -rf snipmate.vim nerdtree

cp -rf vimfiles/. ~/
