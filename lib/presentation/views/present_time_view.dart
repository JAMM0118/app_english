import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PresentTime extends StatelessWidget {
  const PresentTime({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      
      child: PageView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
           Stack(
             children:[ SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      "assets/images/presentito.png",
                      fit: BoxFit.fill,
                    )),
                    Positioned(
              top: 230,
              left: 30,
              child: Text(
                "Activities Stands",
                style: GoogleFonts.getFont(
                  'Chakra Petch',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),),
             Positioned(
              top: 400,
              left: 160,
              child: ShakeY(
                duration: const Duration(seconds: 10),
                infinite: true,
                child: const Icon(Icons.arrow_downward,color: Colors.black,size: 100,)),
              ),
           Positioned(
              top: 300,
              left: 40,
              child: Text(
                "Scroll down for more information",
                style: GoogleFonts.getFont(
                  'Chakra Petch',
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),),
            
        ]),
              
         
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Keep talking and nobody explodes",
                style:GoogleFonts.getFont(
                  'Chakra Petch',
                  fontSize: 25,
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
                  "Step into the heart-pounding world of Keep Talking at our interactive stand. This renowned game, designed for couples and cooperative duos, pushes your teamwork and communication skills to the limit. Your mission: defuse a virtual bomb before time runs out. Every decision you make matters, and survival depends on your ability to work together seamlessly. Can you stay cool under pressure, communicate effectively, and defuse the bomb in time? Get ready for an adrenaline-fueled challenge that will test your ability to cooperate and thrive in the face of danger.",
                  style:GoogleFonts.getFont(
                  'Chakra Petch',
                  fontSize: 20,
                  color: Colors.white,
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
           Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Charades Game",
                style: GoogleFonts.getFont(
                  'Chakra Petch',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  "Get ready to put your creativity and communication skills to the test in our Charades stand. Gather with friends in groups of one to four players and take out your smartphones for a unique twist on this classic game. One player will become the guesser, while the others use their acting prowess to convey words, phrases, and concepts through gestures and clues. It's a race against the clock to see who can guess the most words correctly. Can your team master the art of non-verbal communication and emerge victorious in this entertaining game of wit and imagination?",
                  style: GoogleFonts.getFont(
                  'Chakra Petch',
                  fontSize: 20,
                  color: Colors.white,
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
           Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Twister",
                style: GoogleFonts.getFont(
                  'Chakra Petch',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  "Get ready for a twist on a classic favorite with our Twister Vertical challenge! In this thrilling game designed for a team of four, you'll put your flexibility, balance, and communication skills to the test like never before. The twist? We've taken the traditional Twister game and turned it on its head literally! You'll face the added challenge of playing Twister on a vertical surface. Can your team keep their balance and untangle themselves in this gravity-defying game of coordination and laughter? It's a unique, fun, and unforgettable experience that will have you twisting and turning in new and exciting ways!",
                  style: GoogleFonts.getFont(
                  'Chakra Petch',
                  fontSize: 20,
                  color: Colors.white,
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
           Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Searching the squirrel",
                style:GoogleFonts.getFont(
                  'Chakra Petch',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  "Embark on a thrilling quest in Searching UVardilla an immersive and exciting adventure that will put your team's problem-solving skills to the test. In this stand, a group of a minimum of four and a maximum of six participants will don their detective hats to track down the elusive UVardilla. Your mission: decode the hints and follow the squirrel's path to uncover its hiding spot. Will your team have what it takes to solve the puzzle and locate the Squirrel in this captivating and expansive Escape Room/Detective adventure?",
                  style: GoogleFonts.getFont(
                  'Chakra Petch',
                  fontSize: 20,
                  color: Colors.white,
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
