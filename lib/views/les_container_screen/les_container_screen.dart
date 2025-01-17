import 'package:flutter/material.dart';

class LesContainerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONTAINER'),
      ),
      body: Center(
          child: Container(
        alignment: Alignment.center,
        //задали расположение с помощью метода
        // alignment: Alignment(1, 1), //задали расположение с помощью координат x и у
        height: 200,
        //задаём высоту контейнера
        width: 200,
        //задаём ширину контейнера
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          //!!!важно!!! Вы получите ошибку если цвет указан в виджете контейнера!!!
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            //создание границ контейнера
            color: Colors.deepPurple,
            width: 20, //ширина границы
          ),
          boxShadow: [
            //создание теней контейнера
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 0.0,
                blurRadius: 3.5,
                offset: Offset(5.0, 5.0)),
            BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 0.0,
                blurRadius: 3.5 / 2.0,
                offset: Offset(5.0, 5.0)),
            BoxShadow(
                color: Colors.white,
                spreadRadius: 2.0,
                blurRadius: 3.5,
                offset: Offset(-5.0, -5.0)),
            BoxShadow(
                color: Colors.white,
                spreadRadius: 2.0,
                blurRadius: 3.5 / 2,
                offset: Offset(-5.0, -5.0)),
          ],
        ),
        child: Column(
          children: [
            Text(
              'CONTAINER',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'КОНТЕЙНЕР',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
    );
  }
}
