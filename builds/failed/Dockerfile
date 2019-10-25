FROM centos:7
ENV container docker

# Install packages 
RUN yum update -y
RUN yum install epel-release -y
RUN yum install centos-release-scl -y

RUN yum groups install 'Development Tools' -y
RUN yum install git nano wget libpng-devel lcms2-devel -y

# Clone PngQuant github repo
RUN cd /tmp && git clone --recursive https://github.com/kornelski/pngquant.git

# Checkout PngQuant tagged version
RUN cd /tmp/pngquant && git checkout tags/2.12.5

# Download libpng
RUN cd /tmp && wget http://prdownloads.sourceforge.net/libpng/libpng-1.6.37.tar.gz && tar xvzf libpng-1.6.37.tar.gz

# Configure LibPNG for PngQuant static
RUN mv /tmp/libpng-1.6.37 /tmp/pngquant/libpng && cd /tmp/pngquant/libpng && ./configure --enable-static && make

# Build using make
RUN cd /tmp/pngquant && ./configure --with-openmp --with-lcms2 --prefix=/usr && make && make install