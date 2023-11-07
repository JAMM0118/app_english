import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePageView extends StatelessWidget {
  const MyHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height - 80,
        child: Stack(
          children: [
            Positioned(
              top: 70,
              right: -40,
              child: SlideInRight(
                  duration: const Duration(seconds: 3),
                  child: SizedBox(
                      height: 100,
                      width: 200,
                      child: Image.asset("assets/images/game.gif"))),
            ),
            
            Positioned(
              bottom: 10,
              left: 160,
              child: ShakeX(
                infinite: true,
                duration: const Duration(seconds: 10),
                from:(MediaQuery.sizeOf(context).width)/3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70,
                    width: 60,
                    color: const Color.fromARGB(255, 214, 109, 24),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 220,
              left: 10,
              child: ShakeY(
                infinite: true,
                duration: const Duration(seconds: 10),
                from: -((MediaQuery.sizeOf(context).width ) / 3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70,
                    width: 60,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
             Positioned(
              bottom: 0,
              left: 0,
              child: SlideInLeft(
                child: Dance(
                  infinite: true,
                  duration: const Duration(seconds: 2),
                  child: Container(
                    height: 70,
                    width: 60,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
            
            Positioned(
              top: 270,
              left: 10,
              child: ShakeY(
                infinite: true,
                duration: const Duration(seconds: 10),
                from: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70,
                    width: 60,
                    color: colors.primary,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 220,
              right: 100,
              child: ShakeX(
                infinite: true,
                duration: const Duration(seconds: 10),
                from: (MediaQuery.sizeOf(context).width * .5) / 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70,
                    width: 60,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              right: 10,
              child: ShakeY(
                infinite: true,
                duration: const Duration(seconds: 10),
                from: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70,
                    width: 60,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
            ),
            
            Positioned(
              top: 70,
              left: 0,
              child: SlideInRight(
                child: Dance(
                  infinite: true,
                  duration: const Duration(seconds: 2),
                  child: Container(
                    height: 70,
                    width: 60,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
              Positioned(
              bottom: 290,
              right: 0,
              child: SlideInLeft(
                child: Dance(
                  infinite: true,
                  duration: const Duration(seconds: 2),
                  child: Container(
                    height: 70,
                    width: 60,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.sizeOf(context).width * .5 - 50,
              top: 245,
              child: ElasticInRight(
                duration: const Duration(seconds: 3),
                child: ShakeX(
                    duration: const Duration(seconds: 30),
                    infinite: true,
                    from: MediaQuery.sizeOf(context).width * .5 - 50,
                    child: SizedBox(
                        height: 40,
                        width: 100,
                        child: Image.asset("assets/images/R.gif"))),
              ),
            ),
            Positioned(
              right: (MediaQuery.sizeOf(context).width * .5 - 50),
              bottom: 10,
              child: ElasticInRight(
                duration: const Duration(seconds: 3),
                child: ShakeX(
                    duration: const Duration(seconds: 30),
                    infinite: true,
                    from: -(MediaQuery.sizeOf(context).width * .5 - 50),
                    child: SizedBox(
                        height: 90,
                        width: 100,
                        child: Image.asset("assets/images/spiderman_dancing.gif"))),
              ),
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 70),
                    child: Text("Time to play",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Press Start 2P',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: colors.primary,
                        ))),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    "Choose your time",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20,),
                const _StandsScreen(
                    image: "assets/images/fondoFuturama.png", titulo: "Past time / Future time"),
                
                const SizedBox(height: 20,),
                const _StandsScreen(
                    image: "assets/images/present_time.webp",
                    titulo: "Present time"),
                ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StandsScreen extends StatelessWidget {
  final String image;
  final String titulo;

  const _StandsScreen({required this.image, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      duration: const Duration(seconds: 2),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Column(
          children: [
            Text(
              titulo,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: () => context.push('/standsScreen', extra: {
                  'image-background': titulo =="Past time / Future time"
                      ? "assets/images/OIP_.jpg" 
                      : "assets/images/wallpaper.webp",
                    'titulo': titulo,
                }),
                child: SizedBox(
                  height: 150,
                  width: 330,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
