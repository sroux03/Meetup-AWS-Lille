#! /bin/bash
wp_config=/var/www/html/wordpress/wp-config.php
wget -O /var/www/html/sources.tgz http://wordpress.org/latest.tar.gz
tar -zxf /var/www/html/sources.tgz -C /var/www/html/
touch $wp_config
echo "<?php" >> $wp_config
echo "define('DB_NAME',          'dbname_toreplace');" >> $wp_config
echo "define('DB_USER',          'dbusername_toreplace');" >> $wp_config
echo "define('DB_PASSWORD',      'dbpassword_toreplace');" >> $wp_config
echo "define('DB_HOST',          'dbhost_toreplace');" >> $wp_config
echo "define('DB_CHARSET',       'utf8');" >> $wp_config
echo "define('DB_COLLATE',       '');" >> $wp_config
chmod 644 $wp_config
chown -R www-data:www-data /var/www/html/wordpress
GET https://api.wordpress.org/secret-key/1.1/salt/ >> $wp_config
echo "define('WPLANG'            , '');" >> $wp_config
echo "define('WP_DEBUG'          , false);" >> $wp_config
echo "\$table_prefix  = 'wp_';" >> $wp_config
echo "if ( !defined('ABSPATH') )" >> $wp_config
echo "    define('ABSPATH', dirname(__FILE__) . '/');" >> $wp_config
echo "require_once(ABSPATH . 'wp-settings.php');" >> $wp_config