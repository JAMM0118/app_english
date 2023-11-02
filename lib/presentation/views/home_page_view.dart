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
            title: Padding(
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
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(children: [
              SizedBox(
                height: 400,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: FadeInDown(
                          duration: const Duration(seconds: 1),
                          child: const Text(
                            "Welcome to our English App",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ))),
              ),
              SizedBox(
                height: 300,
                width: 500,
                child: Image.asset(
                  "assets/images/welcome_number_two.webp",
                  fit: BoxFit.fill,
                ),
              ),
              Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
                  child: Center(
                    child: Text(
                        """Duis elit nulla aliquip deserunt ad nisi minim minim. Non officia proident non sint ullamco quis cillum excepteur laborum ullamco labore minim. Exercitation Lorem dolore magna aliquip elit consequat non cillum sit.
                      
                      Incididunt anim occaecat sunt eu eiusmod non pariatur quis labore dolor ullamco voluptate id enim. Aliqua laborum sint commodo esse. Adipisicing elit aute proident enim duis Lorem pariatur pariatur adipisicing.
                      
                      Cillum quis excepteur qui nisi voluptate qui. Adipisicing eiusmod occaecat id ut laborum occaecat id qui enim. Cupidatat magna veniam id velit proident fugiat exercitation duis dolore eiusmod adipisicing id veniam pariatur."""),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                    height: 500,
                    width: 500,
                    child:
                        Image.asset("assets/images/40.png", fit: BoxFit.fill),
                  ),
                
              ]),
            ]);
          },
          childCount: 1,
        ))
      ],
    );
  }
}
