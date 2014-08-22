part of burgerama;

void burgeramaRouteInitializer(Router router, RouteViewFactory view) {
  view.configure({
    'create' : ngRoute(
      path: '/create',
      viewHtml: '<create-call></create-call>'
    ),
    'venues' : ngRoute(
       path: '/venues',
       viewHtml: '<div venues></div>',
       defaultRoute: true
//       mount: {
//         "show" : ngRoute(
//            path: '/:callId/show',
//            viewHtml: '<show-call></show-call>'
//         )
//       }
    )
  });
}