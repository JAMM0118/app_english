import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePageView extends StatelessWidget {
  const MyHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final height_ = MediaQuery.sizeOf(context).height;
    final ancho = MediaQuery.sizeOf(context).width;

    return SizedBox(
      height: height_,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: height_ < 700 ? height_ + 150 : height_ - 75,
          width: double.infinity,
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
                  child: _AnimationMoveX(
                    always: true,
                    height: 70,
                    width: 60,
                    duration: const Duration(seconds: 10),
                    from: (MediaQuery.sizeOf(context).width) / 3,
                    color: const Color.fromARGB(255, 214, 109, 24),
                  )),
              Positioned(
                  bottom: 220,
                  left: 10,
                  child: _AnimationMoveY(
                      always: true,
                      height: 70,
                      width: 60,
                      color: Colors.blueAccent,
                      duration: const Duration(seconds: 10),
                      from: -((MediaQuery.sizeOf(context).width) / 3))),
              Positioned(
                bottom: 0,
                left: 0,
                child: SlideInLeft(
                  child: const _AnimationDance(
                    always: true,
                    height: 70,
                    width: 60,
                    color: Colors.redAccent,
                    duration: Duration(seconds: 2),
                  ),
                ),
              ),
              Positioned(
                  top: 270,
                  left: 10,
                  child: _AnimationMoveY(
                      always: true,
                      height: 70,
                      width: 60,
                      color: colors.primary,
                      duration: const Duration(seconds: 10),
                      from: 100)),
              Positioned(
                top: 220,
                right: 100,
                child: _AnimationMoveX(
                    always: true,
                    height: 70,
                    width: 60,
                    color: Colors.green,
                    duration: const Duration(seconds: 10),
                    from: (MediaQuery.sizeOf(context).width * .5) / 2),
              ),
              const Positioned(
                  bottom: 70,
                  right: 10,
                  child: _AnimationMoveY(
                      always: true,
                      height: 70,
                      width: 60,
                      color: Colors.greenAccent,
                      duration: Duration(seconds: 10),
                      from: 100)),
              Positioned(
                top: 80,
                left: 20,
                child: SlideInRight(
                    child: const _AnimationDance(
                  always: true,
                  duration: Duration(seconds: 2),
                  height: 70,
                  width: 60,
                  color: Colors.amber,
                )),
              ),
              Positioned(
                bottom: 290,
                right: 0,
                child: SlideInLeft(
                  child: const _AnimationDance(
                      always: true,
                      height: 70,
                      width: 60,
                      color: Colors.deepPurpleAccent,
                      duration: Duration(seconds: 2)),
                ),
              ),
              Positioned(
                left: MediaQuery.sizeOf(context).width * .5 - 50,
                top: 245,
                child: ElasticInRight(
                    duration: const Duration(seconds: 3),
                    child: _AnimationMoveX(
                      always: true,
                      height: 40,
                      width: 100,
                      duration: const Duration(seconds: 30),
                      from: MediaQuery.sizeOf(context).width * .5 - 50,
                      child: Image.asset("assets/images/R.gif"),
                    )),
              ),
              Positioned(
                right: (ancho * .5 - 50),
                bottom: 10,
                child: ElasticInRight(
                    duration: const Duration(seconds: 3),
                    child: _AnimationMoveX(
                      always: true,
                      height: 90,
                      width: 100,
                      duration: const Duration(seconds: 30),
                      from: -(MediaQuery.sizeOf(context).width * .5 - 50),
                      child: Image.asset("assets/images/spiderman_dancing.gif"),
                    )),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: height_ <= 900
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
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
                        "Choose your tense",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const _StandsScreen(
                        image: "assets/images/fondoFuturama.png",
                        titulo: "Past tense / Future tense"),
                    const SizedBox(
                      height: 20,
                    ),
                    const _StandsScreen(
                        image: "assets/images/presente.jpg",
                        titulo: "Present tense"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimationMoveX extends StatelessWidget {
  final bool always;
  final double height;
  final double width;
  final Color? color;
  final Duration duration;
  final double from;
  final Widget? child;

  const _AnimationMoveX(
      {this.child,
      required this.always,
      required this.height,
      required this.width,
      this.color,
      required this.duration,
      required this.from});

  @override
  Widget build(BuildContext context) {
    return ShakeX(
      infinite: always,
      duration: duration,
      from: from,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: height,
          width: width,
          color: color,
          child: child,
        ),
      ),
    );
  }
}

class _AnimationMoveY extends StatelessWidget {
  final bool always;
  final double height;
  final double width;
  final Color color;
  final Duration duration;
  final double from;

  const _AnimationMoveY(
      {required this.always,
      required this.height,
      required this.width,
      required this.color,
      required this.duration,
      required this.from});

  @override
  Widget build(BuildContext context) {
    return ShakeY(
      infinite: always,
      duration: duration,
      from: from,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: height,
          width: width,
          color: color,
        ),
      ),
    );
  }
}

class _AnimationDance extends StatelessWidget {
  final bool always;
  final double height;
  final double width;
  final Color color;
  final Duration duration;

  const _AnimationDance({
    required this.always,
    required this.height,
    required this.width,
    required this.color,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Dance(
      infinite: always,
      duration: duration,
      child: Container(
        height: height,
        width: width,
        color: color,
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
                  'image-background': titulo == "Present tense"
                      ? "assets/images/presentito.png"
                      : "assets/images/picapiedrita.png",
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
