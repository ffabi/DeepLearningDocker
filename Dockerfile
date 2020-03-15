FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
MAINTAINER ffabi

RUN echo "Don't cache apt update 2020.03.14"
RUN apt -q update --fix-missing

RUN apt -q install -y apt-utils tmux ssh sudo nano vim git 
RUN apt -q install -y wget gcc cmake supervisor htop mc
RUN apt -q install -y python3-opengl xvfb fontconfig 
RUN apt -q install -y net-tools

RUN wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN bash Miniconda3-latest-Linux-x86_64.sh -b
ENV PATH="/root/miniconda3/bin:${PATH}"

# build checkpoint
COPY copy_files/environments /root/copy_files/environments
RUN for env in /root/copy_files/environments/*.yml; do conda env create -f $env; done
RUN conda init bash
RUN conda env export -n tensorflow_2 > /root/copy_files/environments/backup_tensorflow_2.yml

COPY copy_files/ /root/copy_files/
RUN mv /root/copy_files/.tmux-session /root/.tmux-session

RUN echo "PermitRootLogin yes\nSubsystem sftp internal-sftp" > /etc/ssh/sshd_config
RUN echo "root:init" | chpasswd

#RUN echo "alias init=./root/copy_files/initialize.sh" >> /root/.bashrc
RUN cp /root/copy_files/initialize.sh /root/init.sh





