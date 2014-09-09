part of burgerama;

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