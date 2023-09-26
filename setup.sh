#!/bin/bash

# Update SSH configuration
echo "ClientAliveInterval 68" > /etc/ssh/sshd_config

# Set language environment variables
echo 'LANG=en_US.utf-8' >> /etc/environment
echo 'LC_ALL=en_US.utf-8' >> /etc/environment

# Restart the SSH service to apply changes
systemctl restart sshd

# Install Apache HTTP Server (httpd) and PHP
yum install httpd php -y

# Create a PHP script
cat <<EOF > /var/www/html/index.php
<?php
\$output = shell_exec('hostname');
echo "<h1><center><pre>\$output</pre></center></h1>";
echo "<h1><center> Zomato Production Application Version 2 </center></h1>";
?>
EOF

# Restart Apache HTTP Server and enable PHP-FPM
systemctl restart httpd
systemctl enable httpd
systemctl restart php-fpm
systemctl enable php-fpm
