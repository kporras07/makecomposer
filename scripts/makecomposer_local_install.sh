#!/usr/bin/env bash
DRUSH="./vendor/bin/drush"
SITE_ALIAS="@makecomposer.makecomposer.dev"
SITE_UUID="e97d77ef-ada3-4889-a37c-e3b10b3ad919"
$DRUSH $SITE_ALIAS cc drush
echo "Installing..."
if [ -f ./files/config/sync/core.extension.yml ] ; then $DRUSH $SITE_ALIAS si makecomposer --account-pass=admin -y ; else $DRUSH $SITE_ALIAS si makecomposer --account-pass=admin -y ; fi
echo "Set site uuid..."
$DRUSH $SITE_ALIAS config-set "system.site" uuid "$SITE_UUID" -y
echo "Importing config..."
if [ -f ./files/config/sync/core.extension.yml ] ; then $DRUSH $SITE_ALIAS cim -y ; fi
echo "Cleaning cache..."
$DRUSH $SITE_ALIAS cr
