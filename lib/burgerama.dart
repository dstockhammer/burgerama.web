library burgerama;

import 'dart:html' as html;
import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:angular/animate/module.dart';

part 'burgerama_route_initializer.dart';

part 'venues/components/venues.dart';
part 'venues/models/location.dart';
part 'venues/models/venue.dart';

class BurgeramaApp extends Module {
  BurgeramaApp() {
    bind(VenuesComponent);

    bind(RouteInitializerFn, toValue: burgeramaRouteInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));

    bind(UrlRewriter, toImplementation: BurgeramaUrlRewriter);

    install(new AnimationModule());
  }
}

@Injectable()
class BurgeramaUrlRewriter implements UrlRewriter {
  String call(url) => url.startsWith('lib/')
    ? 'packages/burgerama/${url.substring(4)}'
    : url;
}