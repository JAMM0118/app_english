import 'package:app_english/config/router/app_router.dart';
import 'package:app_english/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized(); // add this line para el splash screen
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp, // set orientation to portrait
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

