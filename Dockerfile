FROM ubuntu:latest

RUN yes | unminimize && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	build-essential \
	flex \
	bison \
	antlr \
	clang \	
	llvm \
	cmake \
	emacs \
	git \
	htop \	
	make \
	binutils \
	python3 \
	python3-distutils \
	python3-dev \
	python3-pip \
	software-properties-common \		
	vim \
	nano \
	&& apt-get -y autoremove && apt-get -y clean \
	   && rm -rf /var/lib/apt/lists/*


ADD [".bashrc", "/root/"]

# Install vim and YouCompleteMe with clang completion
# This must be done as a non-root user.  Sigh.
# Insert vim simplicity of installation rhetoric here...
RUN useradd -ms /bin/bash nbit
USER nbit
RUN mkdir -p ~/.vim/bundle
ADD --chown=nbit .vimrc-bootstrap /home/nbit/.vimrc
RUN git clone https://github.com/VundleVim/Vundle.vim.git /home/nbit/.vim/bundle/Vundle.vim
RUN vim -c 'PluginInstall' -c 'qa!'
RUN cd ~/.vim/bundle/YouCompleteMe/ && python3 install.py --clang-completer

USER root
RUN mv /home/nbit/.vim /root/.vim
RUN chown -R root.root /root/.vim
ADD [".vimrc-final", "/root/.vimrc"]
ADD [".emacs", "/root/.emacs"]

ADD ["bin/*", "/usr/local/bin"]

ADD [".vimrc-global-ycm", "/root/.vimrc"]
ADD [".ycm_extra_conf.py", "/root/.ycm_extra_conf.py"]

# Fix the locale for the manual pages
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8

ENTRYPOINT ["bash"]
