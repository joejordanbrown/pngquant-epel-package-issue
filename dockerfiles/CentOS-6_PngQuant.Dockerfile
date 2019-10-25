FROM centos:6
ENV container docker

# Install packages 
RUN yum update -y

RUN yum install epel-release -y
RUN yum update -y

RUN yum install git wget nano pngquant -y
