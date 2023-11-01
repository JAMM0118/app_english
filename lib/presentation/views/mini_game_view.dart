import 'dart:math'
    show Random; //de esta manera se importa solo una parte de la libreria
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MiniGameView extends StatefulWidget {
  

  const MiniGameView({super.key});

  @override
  State<MiniGameView> createState() => _MiniGameViewState();
}

Curve changeAnimation(int index){
  
  if(index == 1) return Curves.elasticInOut;
  if(index == 2) return Curves.fastEaseInToSlowEaseOut;
  if(index ==3) return Curves.slowMiddle;
  
  return Curves.bounceOut;  
}

class _MiniGameViewState extends State<MiniGameView> {
  double ancho = 50;
  double altura = 50;
  Color colorContainer = Colors.teal;
  double borderRadiusValue = 10.0;
  int index = 0;
    

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

        title: const Center(child:  Text("Mini game")),
        
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
          child: InkWell(
            onTap: () => changeShape() ,
            overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)), //se usa para cambiar el color del overlay (capa gris)
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Stack( //se usa para poner mas de un floating button
        fit: StackFit.expand, //se usa para que el stack ocupe todo el espacio disponible
        children: [
          Positioned( left: 20, bottom: 10,
            child: FloatingActionButton(
              heroTag: 'back', //se usa para que no se confundan los botones flotantes y se pueda poner mas de uno   
              onPressed: () => context.go('/home/0'),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
              backgroundColor: colorContainer,
              child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,),
              
            ),
          ),
          
          Positioned( 
            bottom: 10, 
            right: 20,
            
            child: FloatingActionButton(
              heroTag: 'play', //se usa para que no se confundan los botones flotantes y se pueda poner mas de uno  
              onPressed:changeShape,
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10),),
              backgroundColor: colorContainer,
              child: const Icon( Icons.play_arrow,color: Colors.white),
            ),
          ),

          Positioned( 
            top: 120,
            width: 150,
            right: 130,
            
            child: FloatingActionButton(
              heroTag: 'change', //se usa para que no se confundan los botones flotantes y se pueda poner mas de uno  
              onPressed: (){
                index++;
                if(index > 3) index = 0;
                setState(() {});
              },
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10),),
              backgroundColor: colorContainer,

              child: Text("Change Animation ${index+1}", style: const TextStyle(color: Colors.white), ),

            ),
          ),
          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
    );
  }
}