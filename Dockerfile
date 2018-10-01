FROM eclipse/php

RUN sudo apt-get remove -y php* && \
    sudo apt-get autoremove -y && \
    sudo add-apt-repository -y ppa:ondrej/php && \
    sudo apt-get update -y && \
    sudo apt-get install -y php7.1 php7.1-pdo-mysql php7.1-gd php7.1-mcrypt php7.1-mbstring php7.1-zip php7.1-intl php7.1-xsl php7.1-soap php7.1-bcmath php7.1-curl && \
    sudo apt-get install -y nano fish byobu httpie
    sudo apt-get -y clean && \
    sudo rm -rf /var/lib/apt/lists/*
    
RUN sudo chsh -s $(which fish) user && \
    sudo usermod -a -G www-data user && \
    sudo chown -R user:www-data /projects && \
    sudo chmod -R g+rwxs /projects && \
    sudo echo "umask 002" >> /etc/apache2/envvars
    
ENV PATH /home/user/.composer/vendor/bin:$PATH
