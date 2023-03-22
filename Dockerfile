FROM ubuntu:22.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Prevent dialog during apt install
ENV DEBIAN_FRONTEND noninteractive


# Rust install.
RUN apt-get update && apt-get install -y \
  build-essential \
  curl 
RUN apt-get update

RUN curl https://sh.rustup.rs -sSf | bash -s -- -vy

ENV PATH="/root/.cargo/bin:${PATH}"

# React.
# TODO: Use Nx instead. (because create-react-app sucks: https://youtu.be/2OTq15A5s0Y).
# https://nx.dev/getting-started/react-standalone-tutorial

# Following this Dockerfile: https://github.com/nvm-sh/nvm/blob/master/Dockerfile
# Add user "nvm" as non-root user
RUN useradd -ms /bin/bash nvm

# Copy and set permission for nvm directory
COPY . /home/nvm/.nvm/
RUN chown nvm:nvm -R "home/nvm/.nvm"

# Set sudoer for "nvm"
RUN echo 'nvm ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Download.
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# nvm
RUN echo 'export NVM_DIR="$HOME/.nvm"'                                       >> "$HOME/.bashrc"
RUN echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> "$HOME/.bashrc"
RUN echo '[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion' >> "$HOME/.bashrc"


# nodejs and tools
RUN  source $HOME/.nvm/nvm.sh && \
  nvm install node

# RUN command -v nvm
# RUN nvm install node
