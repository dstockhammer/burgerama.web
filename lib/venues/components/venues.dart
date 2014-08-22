part of burgerama;

@Component(
    selector: 'venues',
    publishAs: 'ctrl',
    templateUrl: 'lib/venues/views/list.html',
    useShadowDom: false
)
class VenuesComponent {
  List<Venue> _venues;
  Router _router;

  VenuesComponent(this._router);

  bool get hasVenues => this._venues != null && this._venues.isNotEmpty;
}