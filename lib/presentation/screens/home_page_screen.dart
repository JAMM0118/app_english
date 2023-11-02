import 'package:app_english/presentation/views/mini_game_view.dart';
import 'package:app_english/presentation/views/achievements_page_view.dart';
import 'package:app_english/presentation/views/home_page_view.dart';
import 'package:app_english/widgets/shared/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final int pageIndex;

  const MyHomePage({super.key, required this.pageIndex});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final viewRoutes = const<Widget>[
    MyHomePageView(),
    AchievementsView(),
    MiniGameView()  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(

        index: widget.pageIndex,
        children: viewRoutes,

      ),
      bottomNavigationBar: CustomBottonNavigation(currentIndex: widget.pageIndex),
    );

  }
}