FROM nvidia/cuda:8.0-cudnn6-runtime

RUN apt-get update
RUN apt-get install -y curl git unzip imagemagick bzip2
RUN git clone git://github.com/yyuu/pyenv.git .pyenv

WORKDIR /
ENV HOME  /
ENV PYENV_ROOT /.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install anaconda3-5.0.0
RUN pyenv global anaconda3-5.0.0
RUN pyenv rehash

RUN conda install pytorch=0.3.1 torchvision cuda90 -c pytorch
RUN pip install torchvision

RUN pip install --upgrade pip
RUN git clone https://github.com/carpedm20/ENAS-pytorch.git
WORKDIR /ENAS-pytorch
RUN apt-get install -y graphviz libgraphviz-dev pkg-config
RUN pip install -r requirements.txt