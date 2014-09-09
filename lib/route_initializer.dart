part of burgerama;

void routeInitializer(Router router, RouteViewFactory view) {
  view.configure({
    'list' : ngRoute(
       path: '/venues',
       viewHtml: '<venues></venues>',
       defaultRoute: true
    )
  });
}