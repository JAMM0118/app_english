import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastFutureTime extends StatelessWidget {
  const PastFutureTime({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "assets/images/Futuramiita.png",
                  fit: BoxFit.fill,
                )
                  
            ),
            Positioned(
              top: 200,
              left: (MediaQuery.of(context).size.width*.5)/3,
              child: Text(
                "Main Stand",
                style: GoogleFonts.getFont(
                  'Handjet',
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),),
             Positioned(
              top: 430,
              left: 170,
              child: ShakeY(
                duration: const Duration(seconds: 10),
                infinite: true,
                child: const Icon(Icons.arrow_downward,color: Colors.white,size: 100,)),
              ),
           Positioned(
              top: 300,
              left: 20,
              child: Text(
                "Scroll down for more information",
                style: GoogleFonts.getFont(
                  'Handjet',
                  fontSize: 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),),
              
        ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Introduction \nPast / Future Stand",
                style: GoogleFonts.getFont(
                  'Handjet',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Prepare to embark on an exhilarating journey through time in our interactive experience. Explore the dynamic activities of the present as you twist and turn in 'Twister,' team up to defuse virtual bombs in 'Keep Talking,' and engage in entertaining charades in 'Charades in English.' For those with a flair for mystery, join the hunt for our elusive squirrel in the 'Escape Room.' Meanwhile, don't miss our unique 'Picapiedras and Futurama' stand, your gateway to understanding the broader context of the event, encompassing both the past and the future. Let's dive in and create timeless memories!",
                  style: GoogleFonts.getFont(
                    'Handjet',
                    fontSize: 25,
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
