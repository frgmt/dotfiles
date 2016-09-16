#!/bin/sh

#
# This script configures my Node.js development setup.
#

if test ! $(which nvm)
then

  # Install NVM
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

  export NVM_DIR="/Users/lenste/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

  # Install the latest stable version of node
  echo "Installing a stable version of Node..."
  nvm install stable

  # Switch to the installed version
  nvm use node

  # Use the stable version of node by default
  nvm alias default node
fi

# All `npm install <pkg>` commands will pin to the version that was available at the time you run the command
npm config set save-exact = true

# Globally install with npm
# To list globally installed npm packages and version: npm list -g --depth=0
#
# Some descriptions:
#
# diff-so-fancy — sexy git diffs
# git-recent — Type `git recent` to see your recent local git branches
# git-open — Type `git open` to open the GitHub page or website for a repository
packages=(
    diff-so-fancy
    git-recent
    git-open
    gulp
    npm-check-updates
    yo
    bower
    spoof
)

npm install -g "${packages[@]}"
