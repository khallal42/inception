#!/bin/bash


#openssl genrsa -des3 -out myserver.key 2048;
openssl req -x509 -nodes -sha256 -days 1825 -keyout $KEY -out $CERTS_ -subj="/";
echo "" > /etc/nginx/conf.d/nginx.conf
sed -i '$ a\server {' /etc/nginx/conf.d/nginx.conf
sed -i '$ a\        listen 443 ssl;' /etc/nginx/conf.d/nginx.conf
sed -i "\$ a\\        server_name $DOMAINE_NAME;" /etc/nginx/conf.d/nginx.conf
sed -i '$ a\        ssl_protocols TLSv1.3;' /etc/nginx/conf.d/nginx.conf
sed -i '$ a\        root /var/www/html;' /etc/nginx/conf.d/nginx.conf
sed -i '$ a\        index index.html index.php;' /etc/nginx/conf.d/nginx.conf
sed -i "\$ a\\        ssl_certificate $CERTS_;" /etc/nginx/conf.d/nginx.conf
sed -i "\$ a\\        ssl_certificate_key $KEY;" /etc/nginx/conf.d/nginx.conf
sed -i '$ a\        location / {' /etc/nginx/conf.d/nginx.conf
sed -i '$ a\            try_files $uri $uri/ =404;' /etc/nginx/conf.d/nginx.conf
sed -i '$ a\        }' /etc/nginx/conf.d/nginx.conf
sed -i '$ a\        location ~ \.php$ {' /etc/nginx/conf.d/nginx.conf
sed -i '$ a\            include /etc/nginx/snippets/fastcgi-php.conf;' /etc/nginx/conf.d/nginx.conf
sed -i '$ a\            fastcgi_pass wordpress:9000;' /etc/nginx/conf.d/nginx.conf
sed -i '$ a\        }' /etc/nginx/conf.d/nginx.conf
sed -i '$ a\}' /etc/nginx/conf.d/nginx.conf

exec nginx -g "daemon off;"