import 'package:flutter/material.dart';

class ModelCardWidget{
  String name;
  Icon icon;
  Color boxColor;
  String navPath;

  ModelCardWidget({
    required this.name,
    required this.icon,
    required this.boxColor,
    required this.navPath,
  });

  static List<ModelCardWidget> getWidgets(){
    List<ModelCardWidget> wigets = [];
    wigets.add(
      ModelCardWidget(
          name: 'Container',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepPurple,
          navPath: '/les_container_screen'
      ),
    );
    wigets.add(
      ModelCardWidget(
          name: 'TapBar',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepOrange,
          navPath: '/les_tab_bar'
      ),
    );
    wigets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.green,
          navPath: '/',
      ),
    );
    wigets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepPurple,
          navPath: '/',
      ),
    );
    wigets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepOrange,
          navPath: '/',
      ),
    );
    wigets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.green,
          navPath: '/',
      ),
    );
    wigets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepPurple,
          navPath: '/',
      ),
    );
    wigets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepOrange,
          navPath: '/',
      ),
    );
    wigets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.green,
          navPath: '/',
      ),
    );

    return wigets;
  }
}