#!/bin/bash
set -euo pipefail

chown -R apache:apache /var/www/html/cafe

find /var/www/html/cafe -type d -exec chmod 755 {} \;
find /var/www/html/cafe -type f -exec chmod 644 {} \;

php -l /var/www/html/cafe/index.php
php -l /var/www/html/cafe/menu.php
php -l /var/www/html/cafe/orderHistory.php
php -l /var/www/html/cafe/processOrder.php
php -l /var/www/html/cafe/health.php
php -l /var/www/html/cafe/version.php

test -f /etc/pki/rds/global-bundle.pem
