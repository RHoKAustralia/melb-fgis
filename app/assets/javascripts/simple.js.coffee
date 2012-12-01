# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# if navigator && navigator.geolocation
  # navigator.geolocation.getCurrentPosition(geo_success, geo_error)
# else
  # error 'Geolocation is not supported.'
#
  # locations = []
  # polyline = null
#
  # addLocation = (coords) ->
    # locations.push
      # datetime: new Date
      # coords: coords
#
    # drawPolyline()
#
  # drawPolyline = ->
    # map.removeLayer(polyline) unless !polyline
#
    # latlngs = locations.map (location) ->
      # return new L.LatLng location.coords.latitude, location.coords.longitude
#
    # polyline = L.polyline(latlngs, {color: 'red'}).addTo(map)
#
  # cachedLat = -37.814053
  # cachedLong = 144.963183
#
  # detectLocation = ->
    # addLocation
      # latitude: cachedLat
      # longitude: cachedLong
#
    # if(Math.random() > 0.5)
      # cachedLat = cachedLat + Math.random() * 0.003 * -1
    # else
      # cachedLat = cachedLat + Math.random() * 0.003
    # if(Math.random() > 0.5)
      # cachedLong = cachedLong + Math.random() * 0.003 * -1
    # else
      # cachedLong = cachedLong + Math.random() * 0.003

# setInterval detectLocation, 1000

$ ->
  data = [
    {
      "title":"Some Title",
      "description":"Some description",
      "geo":[
        {
          "type":"Feature",
          "properties":{
            "type":"SECTOR",
            "description":"Northern Front",
            "color":"red";
            "date_created": "Sat Nov 20 2012 17:49:08 GMT+1100 (EST)"
          },
          "geometry":{
            "type":"Polygon",
            "coordinates":[[[140.58984361589, -35.976560711861], [144.10546861589, -37.207029461861], [145.16015611589, -33.867185711861], [142.34765611589, -35.273435711861], [143.57812486589, -34.921873211861], [139.88671861589, -27.890623211861], [142.52343736589, -34.570310711861], [142.52343736589, -34.746091961861], [140.58984361589, -35.976560711861]]]
          },
          "crs":{
            "type":"name",
            "properties":{
              "name":"urn:ogc:def:crs:OGC:1.3:CRS84"
            }
          }
        }
      ]
    },
    {
      "title":"Some Title",
      "description":"Some description",
      "geo":[
        {
          "type":"Feature",
          "properties":{
            "type":"TEAM"
            "description":"Fuel",
            "color":"green";
            "date_created": "Sat Dec 01 2012 17:49:08 GMT+1100 (EST)"
          },
          "geometry":{
            "type":"Polygon",
            "coordinates":[[[144.22631822526, -37.981565594674], [143.99560533463, -37.827757000924], [144.06152330338, -37.619016766549], [144.65478502213, -37.443235516549], [144.79760728776, -37.816770672799], [144.22631822526, -37.981565594674]]]
          },
          "crs":{
            "type":"name",
            "properties":{
              "name":"urn:ogc:def:crs:OGC:1.3:CRS84"
            }
          }
        }
      ]
    },
    {
      "title":"Some Title",
      "description":"Some description",
      "geo":[
        {
          "type":"Feature",
          "properties":{
            "type":"SECTOR"
            "description":"Fire Line",
            "color":"red";
            "date_created": "Sat Dec 02 2012 00:49:08 GMT+1100 (EST)"
          },
          "geometry":{
            "type":"LineString",
            "coordinates":[[142.83105455338, -36.970823407174], [144.16040025651, -37.344358563424], [144.54492174088, -36.278684735299]]
          },
          "crs":{
            "type":"name",
            "properties":{
              "name":"urn:ogc:def:crs:OGC:1.3:CRS84"
            }
          }
        }
      ]
    },
    {
      "title":"Some title",
      "description":"Some description",
      "geo":[
        {
          "type":"Feature",
          "properties":{
            "type":"SECTOR"
            "description":"Starting Point",
            "color":"black";
            "date_created": "Sat Dec 01 2012 00:49:08 GMT+1100 (EST)"
          },
          "geometry":{
            "type":"Point",
            "coordinates":[139.8865469545, -27.890623211862]
          },
          "crs":{
            "type":"name",
            "properties":{
              "name":"urn:ogc:def:crs:OGC:1.3:CRS84"
            }
          }
        }
      ]
    },
    {
      "title":"Pacman Discovered",
      "description":"James found Pacman",
      "geo":[
        {
          "type":"Feature",
          "properties":{
            "type":"YOU"
            "description":"Pacman",
            "color":"yellow";
            "date_created": "Sat Dec 01 2012 00:49:08 GMT+1100 (EST)"
          },
          "geometry":{
            "type":"Polygon",
            "coordinates":[[[144.92978643046, -37.794939500455], [144.93836949931, -37.78961799777], [144.93459294901, -37.786013108854], [144.93115972147, -37.785498124723], [144.92909978495, -37.785498124723], [144.92703984843, -37.785498124723], [144.92515157328, -37.787214738492], [144.9242932664, -37.789274675016], [144.922748314, -37.793566209439], [144.922748314, -37.796312791471], [144.92343495951, -37.799402696256], [144.92480825053, -37.801119310025], [144.92669652567, -37.801805955533], [144.9309880601, -37.802320939664], [144.93407796488, -37.802320939664], [144.93836949931, -37.801805955533], [144.9399144517, -37.796656114225], [144.92978643046, -37.794939500455]]]
          },
          "crs":{
            "type":"name",
            "properties":{
              "name":"urn:ogc:def:crs:OGC:1.3:CRS84"
            }
          }
        }
      ]
    },
    {
      "title":"Ghost Discovered",
      "description":"James found a Ghost",
      "geo":[
        {
          "type":"Feature",
          "properties":{
            "type":"SECTOR"
            "description":"Ghosts",
            "color":"blue";
            "date_created": "Sat Dec 01 2012 00:49:08 GMT+1100 (EST)"
          },
          "geometry":{
            "type":"Polygon",
            "coordinates":[[[144.94111608134, -37.793566209439], [144.94025777445, -37.79184959567], [144.94111608134, -37.790991288785], [144.94197438822, -37.790991288785], [144.94283269511, -37.791334611539], [144.94300435648, -37.792879563932], [144.94300435648, -37.793051225309], [144.94111608134, -37.793566209439]]]
          },
          "crs":{
            "type":"name",
            "properties":{
              "name":"urn:ogc:def:crs:OGC:1.3:CRS84"
            }
          }
        }
      ]
    }
  ]

  map = L.map('map').setView([-37.793566209439,144.94111608134], 14)
  L.tileLayer('http://{s}.tile.cloudmade.com/aeb94991e883413e8262bd55def34111/997/256/{z}/{x}/{y}.png',{
    attribution: 'Made with love at <a href="https://github.com/vertis/rhok-fgis/">RHoK Melbourne</a>, Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    maxZoom: 18
  }).addTo(map)

  data.forEach (v) ->
    current_time = new Date().getTime()
    feature_time = new Date(v.geo[0].properties.date_created).getTime()
    time_diff_in_minutes = Math.ceil((current_time - feature_time)/1000/60)
    time_diff_in_hours = Math.floor((current_time - feature_time)/1000/60/60)
    time_diff_in_days = Math.floor((current_time - feature_time)/1000/60/60/24)
    if time_diff_in_days > 0
      time_diff = time_diff_in_days + " days ago"
    else
      time_diff = time_diff_in_hours + " hours ago"
      if time_diff_in_hours == 0
        time_diff = time_diff_in_minutes + " minutes ago"
    L.geoJson(v.geo[0], {
      pointToLayer: (feature, latlon) ->
        markerIcon = L.icon
          iconUrl: '/assets/marker-icon.png'
          shadowUrl: '/assets/marker-shadow.png'
        L.marker(latlon, {icon: markerIcon}).addTo(map);
      style: (feature) ->
        return {color: feature.properties.color};
      onEachFeature: (feature, layer) ->
        layer.bindPopup feature.properties.description + "<br><span style=\"float: right; font-size: 0.8em;\">(#{time_diff})</span>"
    }).addTo(map)

    html = "<div class=\"message\" data-type=\"#{v.geo[0].properties.type}\">
              <i class=\"icon-chevron-right pull-right\" style=\"margin: 15px 10px;\"></i>
              <p class=\"pull-right\">#{time_diff}</p>
                <p>#{v.title}</p>
              <p>#{v.description}</p>
            </div>"

    $('div.messages').append($(html).data('geo', v.geo[0]))

  $('ul.breadcrumb li.sub-link').click ->
    selected_view = $(this).data "view"
    current_view = $('ul.breadcrumb li.active').data "view"
    $('ul.breadcrumb li.active').removeClass "active"
    $(this).addClass "active"
    $('div.hud .' + selected_view).toggle()
    $('div.hud .' + current_view).toggle()

  $('button#updates_all').click ->
    $('div.message').hide()
    $('div.message').fadeIn('fast')

  $('button#updates_sector').click ->
    $('div.message').hide()
    $('div.message[data-type="SECTOR"]').fadeIn('fast')

  $('button#updates_team').click ->
    $('div.message').hide()
    $('div.message[data-type="TEAM"]').fadeIn('fast')

  $('button#updates_you').click ->
    $('div.message').hide()
    $('div.message[data-type="YOU"]').fadeIn('fast')

  $('div.message').click ->
    geoList = $(this).data('geo')
    console.log geoList
    geoList.forEach (geo) ->
      switch geo.geometry.type
        when "Point" then map.panTo [geo.geometry.coordinates[1], geo.geometry.coordinates[0]]
        when "LineString" then map.panTo [geo.geometry.coordinates[0][1], geo.geometry.coordinates[0][0]]
        when "Polygon" then map.panTo [geo.geometry.coordinates[0][0][1], geo.geometry.coordinates[0][0][0]]
