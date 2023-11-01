import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MyHomePageView extends StatelessWidget {
  const MyHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title:  Padding(
              padding: EdgeInsets.zero,
              child: Row(children: [
                FadeInLeft(
                  duration: const Duration(seconds: 1),                   
                  child: const Text(
                    "English App",
                     
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                FadeInRight(
                  
                  duration: const Duration(seconds: 1),
                  child: const Icon(
                    Icons.language_outlined,
                    color: Colors.white,
                  ),
                )
              ]),
            ),
            titlePadding: const EdgeInsets.only(left: 20, bottom: 20),
          ),
          backgroundColor: const Color.fromARGB(255, 184, 20, 20),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index){
            return Column(
              children: [
                SizedBox(
                  height: 400,
                  child: Align(
                    alignment: Alignment.topLeft,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,top: 20),
                      child: FadeInDown(
                        duration: const Duration(seconds: 1),
                        child: const Text(
                        "Welcome to our English App",
                        style: TextStyle(fontStyle: FontStyle.italic, 
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                        ),
                      )
                    )
                  ),
                ),
                Container(
                  height: 400,
                  color: Colors.blue,
                ),
                Container(
                  height: 200,
                  color: const Color.fromARGB(255, 58, 243, 33),
                ),
              ]
            );
          },
          
          childCount: 1,
          ) )
      ],
    );
  }
}
