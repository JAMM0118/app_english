import 'package:app_english/presentation/models/stands_model.dart';
import 'package:flutter/material.dart';

class StandsView extends StatelessWidget {
  final StandModel standType;
  const StandsView({super.key, required this.standType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(standType.titulo),
      ),
      body:  Center(
        child: Image.asset(standType.imageBackground),
      ),
    );
  }
}