FROM php:7.4-apache

COPY default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite

# Copy application source
COPY src /var/www/
RUN chown -R www-data:www-data /var/www
RUN chmod 755 /usr/local/bin/start-apache
CMD ["start-apache"]