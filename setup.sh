# setup.sh
#!/bin/bash
set -e

# Wait for the MySQL server to be available
while ! mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
    sleep 1
done

# Update WordPress options using WP-CLI
wp option update siteurl "$WORDPRESS_SITEURL"
wp option update home "$WORDPRESS_HOME"

# Start WordPress
exec apache2-foreground
