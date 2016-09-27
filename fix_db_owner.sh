#!/usr/bin/env sh
echo 'Changing table ownership'
if [ -z $1 ]; then
    echo 'Usage: ./fix_db_owner.sh <DB_NAME>';
    exit 0;
fi
DB_NAME=$1
for tbl in `psql -qAt -c "select tablename from pg_tables where schemaname = 'public';" $DB_NAME` ; do  echo $tbl; psql -c "alter table $tbl owner to pg_ecomm" $DB_NAME; done
echo 'Changing sequence ownership'
for tbl in `psql -qAt -c "select sequence_name from information_schema.sequences where sequence_schema = 'public';" $DB_NAME` ; do echo $tbl; psql -c "alter table $tbl owner to pg_ecomm" $DB_NAME; done
