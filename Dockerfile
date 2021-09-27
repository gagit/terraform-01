FROM ubuntu:focal
#RUN cat /etc/os-release
RUN apt-get update 
RUN apt-get install -y curl apt-transport-https gnupg2
RUN curl https://baltocdn.com/helm/signing.asc > clave.gpg
RUN apt-key add clave.gpg
RUN pwd

#RUN apt-get install -y  \
#    && echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list \
#    && apt-get update 

#    && apt-get install -y git acl openssl openssh-client wget zip vim nano libssh-dev \
#    && apt-get install -y libpng-dev  libzip-dev libjpeg-dev libfreetype6-dev libicu-dev libpq-dev libxml2-dev \
#    && apt-get install -y libssl-dev



