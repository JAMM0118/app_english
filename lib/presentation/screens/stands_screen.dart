import 'package:app_english/presentation/models/stands_model.dart';
import 'package:app_english/presentation/views/past_future_tense_view.dart';
import 'package:app_english/presentation/views/present_tense_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StandsScreen extends StatelessWidget {
  final StandModel standType;
  const StandsScreen({super.key, required this.standType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
          /*gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.5, 1.0],
            colors: [
              Colors.black,
              Colors.grey,
            ],
          ),*/
          image: DecorationImage(
            image: AssetImage(standType.imageBackground),
            fit: BoxFit.fill,
            opacity: 0.4,
          ),
        ),
        ),

        Opacity(
          opacity: 0.6,
          child: Image.asset(
             "assets/images/salvatore.jpg",
        
         
            fit: BoxFit.fill,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            alignment: Alignment.center,
          ),
        ),

        Center(
          child: Container(
            
            child: standType.titulo == "Present tense" ? const PresentTime() : const PastFutureTime(),
          ),
        ),

        Positioned(
            top: 50,
            child: IconButton(
              onPressed: () => context.go("/home/0"),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: Colors.white,
              iconSize: 30,
            )),
          
      ]),
    );
  }
}
