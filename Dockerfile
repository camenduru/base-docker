FROM nvidia/cuda:12.2.0-base-ubuntu22.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
	apt-get install -y aria2 wget git git-lfs python3-pip python-is-python3 && \
	pip install -q torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2+cu118 torchtext==0.15.2 torchdata==0.6.1 --extra-index-url https://download.pytorch.org/whl/cu118 && \
	pip install xformers==0.0.20 triton==2.0.0 && \
	adduser --disabled-password --gecos '' user && \
	mkdir /content && \
	chown -R user:user /content && \

WORKDIR /content
USER user