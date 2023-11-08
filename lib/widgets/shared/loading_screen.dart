import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    Future.delayed(const Duration(milliseconds: 6350), () {
      context.go('/bienvenidaScreen');
    });


    return const Scaffold(
      body: Center(
          child: FadeInImage(
        placeholder: AssetImage("assets/images/loading_image.gif"),
        image: AssetImage(
          "assets/images/loading_image.gif",
        ),
      )),
      backgroundColor: Colors.white,
    );
  }
}
