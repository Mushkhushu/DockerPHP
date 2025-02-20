# Utiliser l'image PHP avec Apache
FROM php:7.4-apache

# Installer les extensions nécessaires
RUN docker-php-ext-install mysqli

# Copier le code du projet dans le conteneur
COPY . /var/www/html/

# Configurer Apache
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Activer les modules Apache nécessaires
RUN a2enmod rewrite

# Exposer le port 80
EXPOSE 80
