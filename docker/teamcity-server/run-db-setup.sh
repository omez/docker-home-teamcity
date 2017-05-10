#!/usr/bin/env bash

PROPS_FILE_PATH="$TEAMCITY_DATA_PATH/config/database.properties"
JDBC_DIR_PATH="$TEAMCITY_DATA_PATH/lib/jdbc"

echo "Configure database"

echo "... waiting for DB to respond ..." && /wait-for-it.sh $TEAMCITY_DATABASE_HOST:$TEAMCITY_DATABASE_PORT -t 60

echo "... copying jdbc adapters ..."
mkdir -p $JDBC_DIR_PATH
cp /jdbc/*.jar $JDBC_DIR_PATH/


echo "... writing database.properties ..."
mkdir -p $(dirname $PROPS_FILE_PATH)

read -d '' props <<- EOF
# generated by run script
connectionUrl=jdbc:mysql://$TEAMCITY_DATABASE_HOST:$TEAMCITY_DATABASE_PORT/$TEAMCITY_DATABASE_NAME
connectionProperties.user=$TEAMCITY_DATABASE_USERNAME
connectionProperties.password=$TEAMCITY_DATABASE_PASSWORD
EOF

echo "$props" > $PROPS_FILE_PATH