# Yes GPU
# FROM nvidia/cuda:11.6.0-runtime-ubuntu20.04
# No GPU
FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

# Git
RUN apt-get update && apt-get -y install git
RUN apt-get update && apt-get -y install curl
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda
RUN conda install -c anaconda pytest
RUN conda install -c anaconda pandas
RUN conda install -c anaconda openpyxl
RUN conda install -c conda-forge s3fs
RUN conda install -c anaconda flask
RUN conda install -c anaconda flask-cors
RUN conda install -c conda-forge gunicorn
RUN conda install -c conda-forge cyipopt
RUN conda install -c anaconda pip
RUN pip install pymongo[srv]
# Install Jax (Yes GPU)
# RUN pip install jax[cuda11_cudnn82] -f https://storage.googleapis.com/jax-releases/jax_releases.html
# Install Jax (No GPU)
RUN pip install --upgrade jax[cpu]

# AWS
RUN apt-get update && apt-get -y install zip unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

# Vim
RUN apt-get update && apt-get -y install vim
RUN mkdir -p /root/.vim/colors
ADD https://raw.githubusercontent.com/tomasiser/vim-code-dark/master/colors/codedark.vim /root/.vim/colors
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ADD .vimrc /root
RUN vim +PlugInstall +qall
RUN apt-get update && apt-get -y install build-essential cmake
RUN python /root/.vim/plugged/YouCompleteMe/install.py --force-sudo
RUN python /root/.vim/plugged/vimspector/install_gadget.py --enable-python

WORKDIR /home

EXPOSE 5000