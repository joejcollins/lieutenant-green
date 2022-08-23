FROM gitpod/workspace-full:latest

# Python 3.6.10 and Starship
RUN pyenv install 3.6.10 \
 && curl -fsSL https://starship.rs/install.sh | sh -s -- --yes
