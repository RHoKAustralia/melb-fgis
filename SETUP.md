Make a user for each of the postgres accounts.
```
for i in fgis_development fgis_test; do /usr/local/bin/createuser -d -E -e -P -s $i; done
```

Create the databases.
```
rake db:create
```

Configure the GIS stuff in the DB.

```
createdb -E UTF8 base_postgis
createlang plpgsql base_postgis

psql -d base_postgis -f /usr/local/share/postgis/postgis.sql
psql -d base_postgis -f /usr/local/share/postgis/spatial_ref_sys.sql
psql -d base_postgis -c "update pg_database set datistemplate = true where datname = 'base_postgis'"
```


