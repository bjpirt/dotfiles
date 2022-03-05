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
$BREW_CMD install --cask authy
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
    "vscjava.vscode-maven" 
)

echo $EXISTING_EXTENSIONS

for ext in ${VSCODE_EXTENSIONS[@]}; do
  echo "Installing $ext"
  code --install-extension $ext
done

$BREW_CMD install --cask firefox
$BREW_CMD install nvm
mkdir -p ~/.nvm

# Add the following to ~/.zshrc or your desired shell configuration file:
#   export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
