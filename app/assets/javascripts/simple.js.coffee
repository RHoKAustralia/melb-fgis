# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# if navigator && navigator.geolocation
  # navigator.geolocation.getCurrentPosition(geo_success, geo_error)
# else
  # error 'Geolocation is not supported.'
#   

$ ->
  data = [{"type":"Feature", "properties":{"type":"sector", "description":"Northern Front", "color":"red"; "date_created": "Sat Nov 20 2012 17:49:08 GMT+1100 (EST)"}, "geometry":{"type":"Polygon", "coordinates":[[[140.58984361589, -35.976560711861], [144.10546861589, -37.207029461861], [145.16015611589, -33.867185711861], [142.34765611589, -35.273435711861], [143.57812486589, -34.921873211861], [139.88671861589, -27.890623211861], [142.52343736589, -34.570310711861], [142.52343736589, -34.746091961861], [140.58984361589, -35.976560711861]]]}, "crs":{"type":"name", "properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"}}}, {"type":"Feature", "properties":{"type":"team"}, "geometry":{"type":"Polygon", "coordinates":[[[144.22631822526, -37.981565594674], [143.99560533463, -37.827757000924], [144.06152330338, -37.619016766549], [144.65478502213, -37.443235516549], [144.79760728776, -37.816770672799], [144.22631822526, -37.981565594674]]]}, "crs":{"type":"name", "properties":{"name":"urn:ogc:def:crs:OGC:1.3:CRS84"}}}]
  
  map = L.map('map').setView([-37.814053,144.963183], 14)
  L.tileLayer('http://{s}.tile.cloudmade.com/aeb94991e883413e8262bd55def34111/997/256/{z}/{x}/{y}.png', { attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>', maxZoom: 18 }).addTo(map)
  # circle = L.circle([-37.814053,144.963183], 500, { color: 'red', fillColor: '#f03', fillOpacity: 0.5}).addTo(map)

  markerIcon = L.icon 
    iconUrl: '/assets/marker-icon.png'
    shadowUrl: '/assets/marker-shadow.png'

  locations = []
  polyline = null

  addLocation = (coords) ->
    locations.push
      datetime: new Date
      coords: coords

    drawPolyline()

  drawPolyline = ->
    map.removeLayer(polyline) unless !polyline

    latlngs = locations.map (location) ->
      return new L.LatLng location.coords.latitude, location.coords.longitude

    polyline = L.polyline(latlngs, {color: 'red'}).addTo(map)

  cachedLat = -37.814053
  cachedLong = 144.963183

  detectLocation = ->
    addLocation 
      latitude: cachedLat
      longitude: cachedLong

    if(Math.random() > 0.5)
      cachedLat = cachedLat + Math.random() * 0.003 * -1
    else
      cachedLat = cachedLat + Math.random() * 0.003
    if(Math.random() > 0.5)
      cachedLong = cachedLong + Math.random() * 0.003 * -1
    else
      cachedLong = cachedLong + Math.random() * 0.003

  poi = data.filter (location) ->
    return location.properties.type == "team"

  L.geoJson(data, {
    style: (feature) ->
      return {color: feature.properties.color};
    onEachFeature: (feature, layer) ->
      current_time = new Date().getTime()
      feature_time = new Date(feature.properties.date_created).getTime()
      time_diff_in_minutes = Math.ceil((current_time - feature_time)/1000/60)
      time_diff_in_hours = Math.floor((current_time - feature_time)/1000/60/60)
      time_diff_in_days = Math.floor((current_time - feature_time)/1000/60/60/24)
      if time_diff_in_days > 0
        time_diff = time_diff_in_days + "d"
      else
        time_diff = time_diff_in_hours + "h"
        if time_diff_in_hours == 0
          time_diff = time_diff_in_minutes + "m"
      layer.bindPopup(feature.properties.description + "<br><span style=\"float: right; font-size: 0.8em;\">(" +  time_diff  + " ago)</span>");
  }).addTo(map)
  
  setInterval detectLocation, 1000
  
  $('ul.breadcrumb li.sub-link').click ->
    selected_view = $(this).data "view"
    current_view = $('ul.breadcrumb li.active').data "view"
    $('ul.breadcrumb li.active').removeClass "active"
    $(this).addClass "active"
    $('div.hud .' + selected_view).toggle()
    $('div.hud .' + current_view).toggle()
