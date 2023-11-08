import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottonNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottonNavigation({super.key, required this.currentIndex});


  void onItemTapped(BuildContext context,int index) {
    switch(index){
      case 0:
        context.go("/home/0"); break;
      case 1:
        context.go("/home/1"); break;
    }

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: BottomNavigationBar( //barra de navegacion inferior
      currentIndex: currentIndex,
       
      //recuerda que en los items se debe poner al menos 2 bottomnavigationbaritem
      //con sus repetivos iconos y labels
        onTap: (index) => onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad_outlined),
            label: "Mini game"
          ),
          
        
        ],
      ),
    );
  }
}