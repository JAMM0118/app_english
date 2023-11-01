import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/301568770156201.gif",
      fit: BoxFit.cover,
    );
    
  }
}