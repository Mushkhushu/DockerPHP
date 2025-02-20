# Utilisez l'image officielle PHP avec Apache
FROM php:7.4-apache

# Installez les dépendances nécessaires pour Composer
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Installez Composer globalement
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copiez les fichiers de votre projet dans le répertoire Apache du conteneur
COPY . /var/www/html/

# Exposez le port 80 pour Apache
EXPOSE 80

# Installez les dépendances PHP via Composer
WORKDIR /var/www/html
RUN composer install

# Démarrez Apache au lancement du conteneur
CMD ["apache2-foreground"]
