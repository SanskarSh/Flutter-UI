import 'package:flutter/material.dart';
// import 'package:the_boys/config/routes/names.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static List<PageEntity> Routes() {
    return [
      // PageEntity(path: AppRoutes.INITIAL, page: page, bloc: bloc),
    ];
  }
}

class PageEntity<T> {
  String path;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.path,
    required this.page,
    required this.bloc,
  });
}
