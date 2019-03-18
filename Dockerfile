FROM centos:7
LABEL maintainer "rmkn"

RUN localedef -i ja_JP -f UTF-8 ja_JP.utf8
RUN sed -i -e '/^LANG=/s/=.*$/=ja_JP.utf8/' /etc/locale.conf 
RUN ln -sf /usr/share/zoneinfo/Japan /etc/localtime 

RUN sed -i -e "/override_install_langs/s/$/,ja_JP.utf8/" /etc/yum.conf
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
RUN yum -y clean all
RUN yum -y update

RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
RUN yum -y install epel-release

RUN yum -y clean all
