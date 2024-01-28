// app/javascript/controllers/map_controller.js

import { Controller } from "@hotwired/stimulus"
import "leaflet"
import "leaflet-css"

// Connects to data-controller="map"
export default class extends Controller {
  static values = { geourl: String }

  connect(){
    var map = L.map('map').setView([54, -4], 6);
    var myStyle = {
      "color": "#ff7800",
      "weight": 5,
      "opacity": 0.65
    };

    var tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 15,
        minZoom: 3,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);


    var geo = fetch(this.geourlValue) 
      .then( function (response) {
        return response.json();
      })
      .then( function (json) {
        var polys = L.geoJson(json, {
          onEachFeature: function (feature, layer) {
            layer.addEventListener("click", () => {
              layer.bindPopup("status: " + feature.properties.status + ", location: " + feature.properties.location + ", shape_length: " + feature.properties.shape_length + ", shape_area: " + feature.properties.shape_area);
            });
          }
        });

        polys.addTo(map);

        map.fitBounds(polys.getBounds());
      })
  }


  disconnect(){
    this.map.remove()
  }
}
