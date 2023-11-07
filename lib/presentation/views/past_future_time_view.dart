import 'package:flutter/material.dart';

class PastFutureTime extends StatelessWidget {
  const PastFutureTime({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.75 ,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              color: Colors.green,
            ),
          
        )
      );
  }
}