import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class HackYourW extends StatelessWidget{
  const HackYourW({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('30M'),),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/demo.png'),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(200),
                  ),
                  child: const Text(
                    "Night sky",
                    style: TextStyle(color: Colors.white),
                  ),
                ).asGlass(
                  enabled: true,
                  blurX: 20,
                  blurY: 20,
                  tintColor: Colors.transparent,
                  clipBorderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}