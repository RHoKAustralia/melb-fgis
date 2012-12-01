# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# if navigator && navigator.geolocation
  # navigator.geolocation.getCurrentPosition(geo_success, geo_error)
# else
  # error 'Geolocation is not supported.'
#   

$ ->
  map = L.map('map').setView([-37.814053,144.963183], 14)
  L.tileLayer('http://{s}.tile.cloudmade.com/aeb94991e883413e8262bd55def34111/997/256/{z}/{x}/{y}.png', { attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>', maxZoom: 18 }).addTo(map)
  circle = L.circle([-37.814053,144.963183], 500, { color: 'red', fillColor: '#f03', fillOpacity: 0.5}).addTo(map)

  markerIcon = L.icon 
  	iconUrl: '/assets/marker-icon.png'
  	shadowUrl: '/assets/marker-shadow.png'

  geo_success = (geo) ->
  	coords = geo.coords
  	L.marker([coords.latitude, coords.longitude], { icon: markerIcon }).addTo map

  geo_error = ->
  	console.log arguments

  navigator.geolocation.getCurrentPosition geo_success, geo_error