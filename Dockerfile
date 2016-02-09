FROM colstrom/fish

ENV EDITOR vim
ENV SHELL fish

RUN apk-install bash python openssh curl git make vim tmux binutils tar

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
RUN nvm install stable

#
# INSTALL fish plugins
#
COPY vendor/bass /tmp/bass
RUN cd /tmp/bass && make install
RUN rm -rf /tmp/bass

COPY config/config.fish /etc/fish/config.fish
COPY config/tmux.conf /etc/tmux.conf
