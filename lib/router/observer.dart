import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class MyRouteObserver extends RoutemasterObserver {
  @override
  void didChangeRoute(RouteData routeData, Page<dynamic> page) {
    debugPrint('''
{
  ---------------------------------Routemaster Log Start-------------------------------
  "path": "${routeData.fullPath}",
  "pathParameters": "${routeData.pathParameters}",
  "queryParameters": "${routeData.queryParameters}",
  "name": "${page.name}"
  ---------------------------------Routemaster Log End---------------------------------
}
''');
  }
}
