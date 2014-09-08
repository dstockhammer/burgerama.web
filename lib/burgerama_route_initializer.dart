part of burgerama;

void burgeramaRouteInitializer(Router router, RouteViewFactory view) {
  view.configure({
    'list' : ngRoute(
       path: '/list',
       viewHtml: '<map></map>',
       defaultRoute: true,
       mount: {
         "show" : ngRoute(
            path: '/:callId/show',
            viewHtml: '<show-call></show-call>'
         )
       }
    )
  });
}