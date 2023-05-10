
if (-not(Test-Path -Path ~/.vim -PathType Leaf)) {
	echo "Creating ~/.vim"
	mkdir ~/.vim
}

if (-not(Test-Path -Path ~/.vimrc -PathType Leaf)) {
	echo "Creating .vimrc link"
	New-Item -ItemType SymbolicLink -Path "~/.vimrc" -Target "~/dotfiles/vim/.vimrc"
}

if (-not(Test-Path -Path ~/AppData/Local/nvim/init.vim -PathType Leaf)) {
	echo "Creating .vimrc link"
	mkdir -p ~/AppData/Local/nvim

	New-Item -ItemType SymbolicLink -Path "~/AppData/Local/nvim/init.vim" -Target "~/dotfiles/nvim/init.vim"
}
