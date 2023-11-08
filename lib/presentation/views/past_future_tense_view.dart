import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastFutureTime extends StatelessWidget {
  const PastFutureTime({super.key});

  @override
  Widget build(BuildContext context) {
    
    final ancho = MediaQuery.sizeOf(context).width;
    final alto = MediaQuery.sizeOf(context).height;
    return PageView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              SizedBox(
                width: ancho,
                height: alto,
                child: Image.asset(
                  "assets/images/Futuramiita.png",
                  fit: BoxFit.fill,
                )
                  
            ),
            Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                  "Main Stand",
                  style: GoogleFonts.getFont(
                    'Handjet',
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Scroll down for more information",
                  style: GoogleFonts.getFont(
                    'Handjet',
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                ShakeY(
                duration: const Duration(seconds: 10),
                infinite: true,
                child: const Icon(Icons.arrow_downward,color: Colors.white,size: 100,)),
          
                ],
              )
            ),
              
        ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Introduction \nPast / Future Stand",
                style: GoogleFonts.getFont(
                  'Handjet',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Prepare to embark on an exhilarating journey through time in our interactive experience. Explore the dynamic activities of the present as you twist and turn in 'Twister,' team up to defuse virtual bombs in 'Keep Talking,' and engage in entertaining charades in 'Charades in English.' For those with a flair for mystery, join the hunt for our elusive squirrel in the 'Escape Room.' Meanwhile, don't miss our unique 'Picapiedras and Futurama' stand, your gateway to understanding the broader context of the event, encompassing both the past and the future. Let's dive in and create timeless memories!",
                  style: GoogleFonts.getFont(
                    'Handjet',
                    fontSize: alto < 660 ? 16 : 23,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ]);
  }
}
