import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {
  final String title;
  final String description;
  final String imageUrl;

  SlideInfo({required this.title, required this.description, required this.imageUrl});
  
}

final slides = <SlideInfo>[
  SlideInfo(title: "Bienvenido a nuestra app", 
  description: """ Estamos emocionados de tenerte aquí 
  y ser parte de tu viaje hacia la fluidez en este hermoso idioma. Con nuestra aplicación, 
  tendrás acceso a cuatro emocionantes actividades diseñadas para mejorar tus habilidades 
  en inglés de manera divertida""", 
  imageUrl: "assets/images/welcome_number_two.webp"),
  
  SlideInfo(title: "Informacion sobre las actividades", 
  description: """Cada actividad tiene su propio stand,
  donde alguien de nuestro equipo te explicara con detalles como realizar las actividades""", 
  imageUrl: "assets/images/welcome_number_one.jpg"),

  SlideInfo(title: "Disfruta de la aventura", description: """Desde ahora el idioma predeterminado de la app sera English
  Exitos en tu aventura ¡Comienza a explorar y aprendamos juntos!""", imageUrl: "assets/images/aprender-ingles.jpg"),
];


class WelcomeScreen extends StatefulWidget {
  
  //static const name = "tutorial_screen";
  
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    
    super.initState();

    pageViewController.addListener(() { 
      final page = pageViewController.page ?? 0; //se obtiene la pagina actual
      if(!endReached && page >= slides.length - 1.5) setState(() => endReached = true); 
      //si la pagina actual es la ultima de la cantidad de slides
      // se cambia el estado de endReached a true (para mostrar el boton de empezar)
    });
    
  }

  //se destruye el pageViewController para evitar que se quede en memoria y consuma recursos
  //usar cada vez que se use un controller o setState
  //es una buena practica hacer esto
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            //scrollDirection: Axis.vertical,
            controller: pageViewController,
            physics: const BouncingScrollPhysics(), //para evitar que haga ese efecto de rebote
            children: slides.map((slideData) => _Slide( //se mapea cada slide
              title: slideData.title,
              description: slideData.description,
              imageUrl: slideData.imageUrl,
            )).toList(), //se convierte en lista porque el children espera una lista
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text("Skip"),
              onPressed: () => context.go("/home/0"),
            ),
            
          ),

          endReached ? Positioned( //si se llega al final se muestra el boton de empezar
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 200),
              child: FilledButton(
                onPressed: () => context.go("/home/0") ,
                child: const Text("Empezar"),
              ),
            ) 
          ):const SizedBox(), //operador ternario para mostrar el boton de empezar o no


        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  
  final String title;
  final String description;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.description, 
    required this.imageUrl, 
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge; //para darle un estilo al titulo del slide/diapositiva
    final descriptionStyle = Theme.of(context).textTheme.bodySmall; //para darle un estilo a la descripcion del slide/diapositiva

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: 
      Center(
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInDown(child: Image(image: AssetImage(imageUrl))),
              const SizedBox(height: 20),
              
              FadeInUp(child: Text(title, style: titleStyle)),
              const SizedBox(height: 20),

              FadeInUp(child: Text(description, style: descriptionStyle)),
            ],
          )
        ),
      );
  }
}