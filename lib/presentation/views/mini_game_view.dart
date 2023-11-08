import 'dart:math'
    show Random; //de esta manera se importa solo una parte de la libreria
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MiniGameView extends StatefulWidget {
  const MiniGameView({super.key});

  @override
  State<MiniGameView> createState() => _MiniGameViewState();
}

Curve changeAnimation(int index) {
  if (index == 1) return Curves.elasticInOut;
  if (index == 2) return Curves.fastEaseInToSlowEaseOut;
  if (index == 3) return Curves.slowMiddle;

  return Curves.bounceOut;
}

class _MiniGameViewState extends State<MiniGameView> {
  double ancho = 50;
  double altura = 50;
  Color colorContainer = Colors.teal;
  double borderRadiusValue = 10.0;
  int index = 0;
  int counter =0;

  void changeShape() {
    final ramdom = Random();

    ancho = ramdom.nextInt(250) + 120;
    altura = ramdom.nextInt(350) + 120;
    colorContainer = Color.fromRGBO(
        ramdom.nextInt(255), //red
        ramdom.nextInt(255), //green
        ramdom.nextInt(255), //blue
        1 //opacity
        );
    borderRadiusValue = ramdom.nextInt(100) + 20;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Mini game")),
      ),
      body: Center(
        child: AnimatedContainer(
          //sirve para animar un contenedor

          duration: const Duration(milliseconds: 400),
          curve: changeAnimation(index),

          //elasticInOut
          //slowMiddle
          //fastEaseInToSlowEaseOut
          width: ancho <= 0 ? 50 : ancho,
          height: altura <= 0 ? 50 : altura,
          decoration: BoxDecoration(
              //decoracion del contenedor

              color: colorContainer,
              borderRadius: BorderRadius.circular(
                  borderRadiusValue <= 0 ? 10 : borderRadiusValue)),
          child: GestureDetector(
            onTap: () {
              changeShape();
              if (counter == 5000) {
                counter = 0;
                winnerDialog(context);
                return;
              }
              counter++;
            },

            //overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)), //se usa para cambiar el color del overlay (capa gris)
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        //se usa para poner mas de un floating button
        fit: StackFit
            .expand, //se usa para que el stack ocupe todo el espacio disponible
        children: [
          Positioned(
            bottom: 10,
            right: 20,
            child: FloatingActionButton(
              heroTag:
                  'play', //se usa para que no se confundan los botones flotantes y se pueda poner mas de uno
              onPressed: () {
                changeShape();
                if (counter == 5000) {
                  counter = 0;
                  winnerDialog(context);
                  return;
                }
                counter++;
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: colorContainer,
              child: const Icon(Icons.play_arrow, color: Colors.white),
            ),
          ),

          Positioned(
            top: 120,
            width: 157,
            right: 30,
            child: FloatingActionButton(
              heroTag:
                  'change', //se usa para que no se confundan los botones flotantes y se pueda poner mas de uno
              onPressed: () {
                index++;
                if (index > 3) index = 0;
                setState(() {});
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: colorContainer,

              child: Text(
                "Change Animation ${index + 1}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 123,
            height: 55,
            width: 110,
            left: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Material(
                color: colorContainer,
                child: Center(
                  child: Text(
                    "Counter $counter",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            width: 100,
            left: 30,
            child: FloatingActionButton(
              heroTag:
                  'about', //se usa para que no se confundan los botones flotantes y se pueda poner mas de uno
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible:
                  
                      false, //para que no se pueda cerrar el dialogo dando click fuera de el
                  builder: (context) => AlertDialog(
                    title: const Text("Time to play!"),
                    content: const Text(
                        "This app was made by four people: \n\n- Jhon Alejandro Martinez\n- Santiago Reyes\n- Juan Miguel Posso\n- Victor Hernandez"),
                    actions: [
                      FilledButton(
                          onPressed: () => context.pop(),
                          child: const Text("Aceptar"))
                    ],
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: colorContainer,

              child: const Text(
                "About App",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
    );
  }
}

void winnerDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible:
        false, //para que no se pueda cerrar el dialogo dando click fuera de el
    builder: (context) => AlertDialog(
      title: const Text("LET'S GO!"),
      content: Wrap(
        children: [
          
          const Text(
              "You won the game!, congratulations, now you can get a prize in the main stand, remember to show this message to the stand's owner"),
             Center(
               child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    "assets/images/copa.gif",
                  ),
                ),
             ),
          
          
        ],
      ),
      actions: [
        FilledButton(
            onPressed: () => context.pop(), child: const Text("Aceptar"))
      ],
    ),
  );
}
