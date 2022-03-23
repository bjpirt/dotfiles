#!/usr/bin/env bash

BREW_CMD=/opt/homebrew/bin/brew

if ! command -v $BREW_CMD &> /dev/null
then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

$BREW_CMD upgrade

$BREW_CMD install --cask docker
$BREW_CMD install --cask spotify
$BREW_CMD install --cask bbedit
$BREW_CMD install --cask bitwarden
$BREW_CMD install --cask slack
$BREW_CMD install --cask authy
$BREW_CMD install --cask tableplus
$BREW_CMD install --cask aws-vpn-client
$BREW_CMD install --cask tunnelblick
$BREW_CMD install --cask visual-studio-code
ln -sf "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code

VSCODE_EXTENSIONS=(\
    "alexkrechik.cucumberautocomplete" \
    "esbenp.prettier-vscode" \
    "esbenp.prettier-vscode" \
    "fabianlauer.vs-code-xml-format" \
    "hashicorp.terraform" \
    "lacroixdavid1.vscode-format-context-menu" \
    "ms-azuretools.vscode-docker" \
    "ms-python.python" \
    "ms-python.vscode-pylance" \
    "ms-vscode-remote.remote-containers" \
    "ms-vsliveshare.vsliveshare" \
    "redhat.java" \
    "tomoki1207.pdf" \
    "VisualStudioExptTeam.vscodeintellicode" \
    "vscjava.vscode-java-debug" \
    "vscjava.vscode-java-dependency" \
    "vscjava.vscode-java-pack" \
    "vscjava.vscode-java-test" \
    "vscjava.vscode-maven" \
    "dbaeumer.vscode-eslint" \
    "oderwat.indent-rainbow" \
    "2gua.rainbow-brackets" \
    "eamodio.gitlens"
)

echo $EXISTING_EXTENSIONS

for ext in ${VSCODE_EXTENSIONS[@]}; do
  echo "Installing $ext"
  code --install-extension $ext
done

$BREW_CMD install --cask firefox
$BREW_CMD install nvm
mkdir -p ~/.nvm

brew install java
brew install java11
brew install awscli
brew install jq
brew install aws-vault
brew install wget
brew install socat
brew install xquartz
brew install rbenv
brew install libpq
