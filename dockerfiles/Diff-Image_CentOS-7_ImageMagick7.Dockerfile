FROM centos:7

# Install packages 
RUN yum update -y

RUN yum install epel-release -y
RUN yum update -y

RUN yum groups install 'Development Tools' -y
RUN yum install git nano wget -y
RUN yum install lcms2-devel -y

# Requires higher version of ImageMagick than CentOS EPEL package
RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
RUN yum --enablerepo=remi install ImageMagick7 -y