import 'package:app_english/presentation/views/mini_game_view.dart';
import 'package:app_english/presentation/views/logros_page_view.dart';
import 'package:app_english/presentation/views/home_page_view.dart';
import 'package:app_english/widgets/shared/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final int pageIndex;

  const MyHomePage({super.key, required this.pageIndex});

  final viewRoutes = const<Widget>[
    MyHomePageView(),
    LogrosScreen(),
    MiniGameView()

    
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottonNavigation(currentIndex: pageIndex),
    );

  }
}