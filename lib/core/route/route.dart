import 'package:b7c_clean_architecture/features/splashs/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/routes/all_route.dart';

enum RouteType { push, pushReplace, pushRemove }

const initialRoute = SplashView.routeName;

//====GENERATE ROUTES====
Route<dynamic>? generateRoutes(RouteSettings settings) {
  AllRoute().getKey();
  return MaterialPageRoute(
    builder: (context) =>
        AllRoute.allRouteMap[settings.name]?.clazz ?? const SizedBox(),
    settings: settings,
  );
}

//====GO TO PAGE====
Future goToNamed(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required String routeName,
}) {
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacementNamed(context, routeName,
        arguments: arguments, result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
  return Navigator.pushNamed(context, routeName, arguments: arguments);
}

///
Future goTo(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required Widget page,
}) {
  var pageRoute = MaterialPageRoute(
    builder: (context) => page,
    settings: RouteSettings(name: "/${page.toString()}", arguments: arguments),
  );
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacement(context, pageRoute,
        result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushAndRemoveUntil(
      pageRoute,
      (route) => false,
    );
  }
  return Navigator.push(
    context,
    pageRoute,
  );
}

///
Future goToSlide(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required Widget page,
}) {
  var pageRoute = PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: page,
      );
    },
    settings: RouteSettings(name: "/${page.toString()}", arguments: arguments),
  );
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacement(context, pageRoute,
        result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushAndRemoveUntil(
      pageRoute,
      (route) => false,
    );
  }
  return Navigator.push(
    context,
    pageRoute,
  );
}
