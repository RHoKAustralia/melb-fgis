### Steps to install a local tile server ###
(Steve Bennett)

#### Preparation ####
1. First, create a style with TileMill. You can install TileMill offline, but you need a database populated with OpenStreetMap data (eg, steveko.wordpress.com/2013/05/08/tilemill-server/). The style I'm using here is a rough conversion of a cycling basemap)
2. Export as MBTiles (zoom 13: 188MB, zoom 14: 492MB)

#### Deployment in Vagrant ####
```
# Install MBTiles-server
sudo apt-get install -y nodejs npm
git clone https://github.com/chelm/mbtiles-server
cd mbtiles-server
wget http://cycletour.org:5004/fgis_z13.mbtiles

# Run MBTiles-server (default port 3000)
node server.js fgis_z13.mbtiles

```
#### Using tiles in leaflet ####

 Add a layer like this:
```
        L.tileLayer('http://localhost:3000/{z}/{x}/{y}.png', {
           maxZoom: 13,
            attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>'
        }).addTo(map);
```
