import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


class SlideInfo {
  final String title;
  final String description;
  final String imageUrl;

  SlideInfo({required this.title, required this.description, required this.imageUrl});
  
}

final slides = <SlideInfo>[
  SlideInfo(title: "Welcome to a Time-Traveling Adventure like no other!", 
  description: """ Prepare to be captivated as we guide you through a journey spanning the past, present, and future, all within the walls of our exciting event""", 
  imageUrl: "assets/images/aprender-ingles.jpg"),
  
  SlideInfo(title: "Information about activities", 
  description: """ Prepare to embark on a thrilling journey through time in our interactive experience. From exploring historical wonders in the Past Tense Exploration to navigating the high-stakes present in 'Keep Talking' and 'Charades in English,'. Don't forget to join the hunt for our elusive squirrel, in the 'Escape Room,' all while discovering the charm of the Picapiedras and Futurama stand, where the past and future converge. Let's dive in and make unforgettable memories across time!""", 
  imageUrl: "assets/images/welcome_number_one.webp"),

  SlideInfo(title: "IT'S TIME TO PLAY!", description: "Enjoy the adventure dude!", 
imageUrl: "assets/images/time_to_play.gif"),
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
          
          endReached ? const SizedBox() :Positioned(
            left: 180,
            
            bottom: 130,
            child: ShakeX(

              duration: const Duration(milliseconds: 1500),
              infinite: true,

              child: const Icon(Icons.arrow_forward, size: 40, color: Colors.black87,))
            
          ),

          endReached ? Positioned( //si se llega al final se muestra el boton de empezar
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 200),
              child: FilledButton(
                onPressed: () => context.go("/home/0") ,
                child: const Text("Start"),
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
              
              FadeInUp( 
                child: Text(title, 
                
                style: title =="IT'S TIME TO PLAY!" ? 
                GoogleFonts.getFont(
                            'Press Start 2P',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            
                            color: Colors.black, 
                          )
                  :titleStyle),
              ),
              const SizedBox(height: 20),

              FadeInUp(child: Text(description, style: description == "Enjoy the adventure dude!"
              ?GoogleFonts.getFont(
                          'Press Start 2P',
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black, 
                        )
              
              :descriptionStyle)),
            ],
          )
        ),
      );
  }
}