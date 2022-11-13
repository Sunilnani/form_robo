import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';



class NavigationService {

  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static final RouteObserver<PageRoute> routeObserver =
  RouteObserver<PageRoute>();

  Future<dynamic> navigateTo<T>(
      Route<T> route, {
        bool replaceAll = false,
        bool replace = false,
        dynamic removeUntil,
      }) {
    if(navigatorKey.currentState == null) {
      return Future.value(null);
    }
    if(replace) {
      return navigatorKey.currentState!.pushReplacement(route);
    }
    if (removeUntil != null) {
      return navigatorKey.currentState!.pushAndRemoveUntil(route, removeUntil);
    }
    if (replaceAll) {
      return navigatorKey.currentState!
          .pushAndRemoveUntil(route, (route) => false);
    } else {
      return navigatorKey.currentState!.push(route);
    }
  }

  Future<dynamic> navigatePage(Widget page,
      {PageTransitionType type = PageTransitionType.fade,
        bool replaceAll = false,
        bool replace = false,
        dynamic removeUntil,
        bool isModal = false,
        String name = ''}) {
    if (isModal) {
      return navigateTo<dynamic>(PageRouteBuilder<dynamic>(
        opaque: false,
        pageBuilder: (context, _, __) {
          return page;
        },
        fullscreenDialog: true,
        settings: RouteSettings(name: name),
      ));
    }
    return navigateTo(
        PageTransition(
          settings: RouteSettings(name: name),
          child: page,
          type: type,
          curve: Curves.easeInOut,
        ),
        replace: replace,
        removeUntil: removeUntil,
        replaceAll: replaceAll);
  }

  pop() {
    navigatorKey.currentState!.pop();
  }
}
