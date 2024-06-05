# Use an official PHP runtime as a parent image
FROM php:7.4-fpm

# Set the working directory
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY ./html /var/www/html

# Install necessary PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Expose port 9000
EXPOSE 9000

# Define the command to run the app
CMD ["php-fpm"]

