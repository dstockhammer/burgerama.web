part of burgerama;

@Component(
    selector: 'venues',
    publishAs: 'ctrl',
    templateUrl: 'lib/venues/views/list.html',
    useShadowDom: false
)
class VenuesComponent {
  ObjectStore _store;

  bool isLoaded = false;

  List<Venue> venues = new List<Venue>();

  VenuesComponent(this._store) {
    this._store.list(Venue).then((venues) {
      this.venues = venues;
      this.isLoaded = true;
    });
  }

  bool get hasVenues => this.venues != null && this.venues.isNotEmpty;
}