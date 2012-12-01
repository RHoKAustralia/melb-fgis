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
for i in fgis_development fgis_test
do
/usr/local/bin/psql $i -f /usr/local/share/postgis/postgis.sql
/usr/local/bin/psql $i -f /usr/local/share/postgis/spatial_ref_sys.sql
done
```


