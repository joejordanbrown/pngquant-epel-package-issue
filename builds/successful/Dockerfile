FROM centos:7
ENV container docker

# Install repo packages 
RUN yum install epel-release centos-release-scl -y

# Update packages
RUN yum update -y

# RUN yum groups install 'Development Tools' -y
RUN yum install git nano wget libpng-devel lcms2-devel devtoolset-3 -y

# Clone PngQuant github repo
RUN cd /tmp && git clone --recursive https://github.com/kornelski/pngquant.git

# Checkout PngQuant tagged version
RUN cd /tmp/pngquant && git checkout tags/2.12.5

# Download libpng
RUN cd /tmp && wget http://prdownloads.sourceforge.net/libpng/libpng-1.6.37.tar.gz && tar xvzf libpng-1.6.37.tar.gz

# Configure libpng for PngQuant static
RUN mv /tmp/libpng-1.6.37 /tmp/pngquant/libpng && cd /tmp/pngquant/libpng && ./configure --enable-static CC=/opt/rh/devtoolset-3/root/usr/bin/gcc && make

# Build using make
RUN cd /tmp/pngquant && ./configure --with-openmp --with-lcms2 --prefix=/usr CC=/opt/rh/devtoolset-3/root/usr/bin/gcc && make && make install