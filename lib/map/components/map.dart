part of burgerama;

@Component(
    selector: 'venue-map',
    publishAs: 'ctrl',
    template: '<h1>Hello!!</h1><div id="map-canvas"></div>',
//    templateUrl: 'lib/map/views/map.html',
    useShadowDom: false
)
class MapComponent {
  String title = "Google Maps";

  MapComponent() {
    final mapOptions = new MapOptions()
      ..center = new LatLng(51.51, -0.11) // London
      ..mapTypeId = MapTypeId.ROADMAP
      ..overviewMapControl = false
      ..scaleControl = true
      ..streetViewControl = true
      ..zoomControl = true
      ..mapTypeControl = false
      ..panControl = true
      ..zoom = 16;

    final map = new GMap(html.querySelector("#map-canvas"), mapOptions);
  }
}