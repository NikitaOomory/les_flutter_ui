import 'package:flutter/material.dart';
import 'package:les_flutter_ui/models/model_card_ui_kit.dart';

import '../models/model_card_widget.dart';

class MainNavigationScreen extends StatelessWidget {

  List<ModelCardWidget> widgets = [];
  List<ModelCardUIKit> kits = [];

  void _getModelWidgets() {
    widgets = ModelCardWidget.getWidgets();
  }

  void _getKits() {
    kits = ModelCardUIKit.getUICard();
  }

  @override
  Widget build(BuildContext context) {
    _getModelWidgets();
    _getKits();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView(
        children: [
          searchWidget(),
          SizedBox(height: 15,),
          widgetsList(widgets),
          SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'UI-kits',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              SizedBox(height: 20,),
              kitsList(kits),
            ],
          ),
        ],
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    title: Text('UI-kit'),
    centerTitle: true,
    leading: Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              'МКСКОМ',
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              'МКСКОМ',
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ],
  );
}

Container searchWidget() {
  return Container(
    margin: EdgeInsets.only(top: 40, left: 20, right: 20),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.11),
        blurRadius: 40,
        spreadRadius: 0.0,
      ),
    ]),
    child: TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.search),
          hintText: 'Поиск',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 0.4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.settings),
                  ),
                ],
              ),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          )),
    ),
  );
}

Column widgetsList(List<ModelCardWidget> widgets) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'Flutter widgets',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        height: 150,
        child: ListView.separated(
            itemCount: widgets.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 20,
            ),
            separatorBuilder: (context, index) => SizedBox(
                  width: 25,
                ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(widgets[index].navPath);
                },
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                      color: widgets[index].boxColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
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
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: widgets[index].icon,
                      ),
                      Text(
                        widgets[index].name,
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    ],
  );
}

Padding kitsList(List<ModelCardUIKit> kits){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Container(
      height: 440,
      child: ListView.separated(
        padding: EdgeInsets.only(
            left: 20, top: 20, right: 20, bottom: 20),
        separatorBuilder: (context, index) => SizedBox(
          width: 25,
        ),
        itemCount: kits.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
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
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 350,
                  height: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      kits[index].imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    width: 350,
                    alignment: Alignment.center,
                    child: Text(
                      kits[index].name,
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          );
        },
      ),
    ),
  );
}