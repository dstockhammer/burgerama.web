part of burgerama;

@Component(
    selector: 'map',
    publishAs: 'ctrl',
    templateUrl: 'lib/map/map.html'
)
class MapComponent implements ShadowRootAware {
  @override
  onShadowRoot(ShadowRoot shadowRoot) {
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

    final map = new GMap(shadowRoot.querySelector("#map-canvas"), mapOptions);
  }
}