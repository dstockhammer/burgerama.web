library burgerama;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:hammock/hammock.dart';
import 'package:google_maps/google_maps.dart';

part 'route_initializer.dart';
part 'hammock_config.dart';

part 'account/user_widget.dart';
part 'account/user.dart';

part 'header/header_widget.dart';

part 'venues/components/venues.dart';
part 'venues/models/location.dart';
part 'venues/models/venue.dart';

part 'map/map.dart';

class BurgeramaApp extends Module {
  BurgeramaApp() {
    install(new Hammock());

    bind(VenuesComponent);
    bind(MapComponent);
    bind(UserWidgetComponent);
    bind(HeaderWidgetComponent);

    bind(RouteInitializerFn, toValue: routeInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));

    bind(UrlRewriter, toImplementation: BurgeramaUrlRewriter);
    bind(HammockConfig, toImplementation: BurgeramaHammockConfig);
  }
}

@Injectable()
class BurgeramaUrlRewriter implements UrlRewriter {
  String call(url) => url.startsWith('lib/')
    ? 'packages/burgerama/${url.substring(4)}'
    : url;
}