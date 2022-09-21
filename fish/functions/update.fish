function update
    sudo test 1
    rustup update &
    brew update && brew upgrade &
    sudo apt update && sudo apt upgrade -y &
    sudo apt autoremove -y
    nvim +PackerSync +qall
end
