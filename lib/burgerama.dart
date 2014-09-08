library burgerama;

import 'dart:html' as html;
//import 'dart:async';
//import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
//import 'package:angular/animate/module.dart';
import 'package:hammock/hammock.dart';
import 'package:google_maps/google_maps.dart';

part 'burgerama_route_initializer.dart';

part 'venues/components/venues.dart';
part 'venues/models/location.dart';
part 'venues/models/venue.dart';

part 'map/components/map.dart';

class BurgeramaApp extends Module {
  BurgeramaApp() {
    install(new Hammock());

    bind(VenuesComponent);
    bind(MapComponent);

    bind(RouteInitializerFn, toValue: burgeramaRouteInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));

    bind(UrlRewriter, toImplementation: BurgeramaUrlRewriter);
    bind(HammockConfig, toImplementation: BurgeramaHammockConfig);
  }
}

@Injectable()
class BurgeramaHammockConfig extends HammockConfig {
  Venue deserializeVenue(Resource r) => new Venue()
    ..id = r.content["id"]
    ..name = r.content["name"]
    ..url = r.content["url"]
    ..description = r.content["description"]
    ..address = r.content["address"]
    ..outings = r.content["outings"]
    ..totalRating = r.content["totalRating"]
    ..totalVotes = r.content["totalVotes"];

  Resource serializeVenue(Venue venue) => resource("venues", venue.id, {
    "id": venue.id,
    "name": venue.name,
    "url": venue.url,
    "description": venue.description,
    "address": venue.address,
    "outings": venue.outings,
    "totalRating": venue.totalRating,
    "totalVotes": venue.totalVotes
  });

  BurgeramaHammockConfig(Injector injector) : super(injector) {
    this.urlRewriter.baseUrl = "http://api.dev.burgerama.co.uk/";
    this.config = {
       "venues": {
         "type": Venue,
         "serializer": serializeVenue,
         "deserializer": { "query": deserializeVenue }
       }
    };
  }
}

@Injectable()
class BurgeramaUrlRewriter implements UrlRewriter {
  String call(url) => url.startsWith('lib/')
    ? 'packages/burgerama/${url.substring(4)}'
    : url;
}