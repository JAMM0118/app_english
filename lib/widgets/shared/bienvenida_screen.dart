import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleStyle = Theme.of(context)
        .textTheme
        .titleLarge; //para darle un estilo al titulo del slide/diapositiva
    final TextStyle? descriptionStyle = Theme.of(context)
        .textTheme
        .bodySmall; //para darle un estilo a la descripcion del slide/diapositiva
    const String title = "¡Bienvenido a Time to Play!";
    const String description =
        """Esta es una experiencia que incluye una variedad de actividades, todas ellas en inglés. No importa si sabes poco o mucho, estaremos aquí para guiarte y resolver cualquier duda que puedas tener. Lo más importante es atreverse a utilizar el inglés, sin preocuparte por cometer errores.""";

    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInDown(
                  child: const Image(
                      image:
                          AssetImage("assets/images/welcome_number_two.webp"))),
              const SizedBox(height: 20),
              FadeInDown(child: Text(title, style: titleStyle)),
              const SizedBox(height: 20),
              FadeInDown(child: Center(child: Text(description, style: descriptionStyle))),
            
              
            ],
          ),
        ),
        Positioned(
                bottom: 140,
                left: MediaQuery.of(context).size.width / 2-100,
                child: FadeIn(
                  duration: const Duration(seconds: 6),
                  child: Swing(
                  infinite: true,  
                  duration: const Duration(seconds: 3),
                  child: 
                  const Text("¡Diviertete! ¡Let's do it!", style: 
                  TextStyle(color: Colors.black, 
                  fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                ),
              ),
        Positioned(
            bottom: 30,
            right: 30,
            child: SlideInRight(
                from: 15,
                delay: const Duration(milliseconds: 200),
                child: FilledButton(
                  
                  onPressed: () => context.go("/welcomeScreen"),
                  child: const Text("Empezar"),
                ))),
      ]),
      backgroundColor: Colors.white,
    );
  }
}
