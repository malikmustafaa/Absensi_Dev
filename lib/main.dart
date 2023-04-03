import 'dart:developer';

import 'package:b7c_clean_architecture/contants/color_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:b7c_clean_architecture/core/route/route.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/route/route_observer.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env.dev");
  if (kDebugMode) {
    log("\n:: RUNNING ON :: ${dotenv.env['NODE_ENV']?.toUpperCase()} MODE");
  }

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildMaterial(context);
  }

  Widget _buildMaterial(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      title: 'SMKN1 LSM',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        colorScheme: const ColorScheme.light(primary: default2Color),
      ),
      debugShowCheckedModeBanner: false,
      // home: const DaftarPpdbView(),
      onGenerateRoute: generateRoutes,
      initialRoute: initialRoute,
      navigatorObservers: [
        IRouteObserver(),
      ],
    );
  }
}
