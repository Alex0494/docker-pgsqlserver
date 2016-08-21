FROM postgres
MAINTAINER alex0494

RUN  \
apt-get update && \
apt-get -y upgrade && \
sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
apt-get install -y net-tools && \
apt-get install -y build-essential && \
apt-get install -y software-properties-common && \
apt-get install -y curl wget vim

#Install apache2
RUN apt-get install -y apache2

#start apache2
RUN service apache2 start

#Install php5 + pgadmin
RUN apt-get install -y php5-cli php5 php5-pgsql postgresql-contrib phppgadmin

# Activate a2enmod
RUN a2enmod rewrite && service apache2 restart

# Fix phppgadmin
ADD ./phppgadmin.conf /etc/apache2/conf.d/phppgadmin
ADD ./config.inc.php /usr/share/phppgadmin/conf/config.inc.php
RUN sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/g' /etc/php5/apache2/php.ini

EXPOSE 80
ADD start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["bash", "start.sh"]
