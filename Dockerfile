FROM debian:11

RUN apt-get update && apt-get install -y wget iputils-ping vim curl net-tools php7.4 php7.4 php7.4 php7.4-curl php7.4 php7.4-gd php7.4 php7.4-cli php7.4 php7.4-mbstring php7.4 php7.4-mysql php7.4 php7.4-xml php7.4-intl php7.4-zip php7.4-bz2 php7.4-cli php-cas php7.4-imap php7.4-ldap php7.4-xmlrpc php7.4-soap php7.4-snmp php-apcu 
RUN sed -ri 's,#ServerName,ServerName 10.0.0.20,;s,www.example.com,,' /etc/apache2/sites-available/000-default.conf

EXPOSE 80

RUN cd /tmp && wget https://github.com/glpi-project/glpi/releases/download/10.0.6/glpi-10.0.6.tgz && tar -xvzf glpi-10.0.6.tgz && mv glpi /var/www/html/ && chmod 775 /var/www/html/* -Rf && chown www-data. /var/www/html/* -Rf 

CMD ["apache2ctl", "-D", "FOREGROUND"]
