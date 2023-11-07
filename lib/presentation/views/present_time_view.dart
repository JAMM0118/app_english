import 'package:flutter/material.dart';

class PresentTime extends StatelessWidget {
  const PresentTime({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.75 ,
        child: PageView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              color: Colors.red,
              child: Center(child: Text("Present time")),
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ),
      
    );
  }
}