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
    List<ModelCardWidget> widgets = [];
    widgets.add(
      ModelCardWidget(
          name: 'Container',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepPurple,
          navPath: '/les_container_screen'
      ),
    );
    widgets.add(
      ModelCardWidget(
          name: 'TapBar',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepOrange,
          navPath: '/les_tab_bar'
      ),
    );
    widgets.add(
      ModelCardWidget(
          name: 'Drawer',
          icon: Icon(Icons.settings),
          boxColor: Colors.green,
          navPath: '/les_drawer',
      ),
    );
    widgets.add(
      ModelCardWidget(
          name: 'TextField',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepPurple,
          navPath: '/les_text_field',
      ),
    );
    widgets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepOrange,
          navPath: '/',
      ),
    );
    widgets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.green,
          navPath: '/',
      ),
    );
    widgets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepPurple,
          navPath: '/',
      ),
    );
    widgets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.deepOrange,
          navPath: '/',
      ),
    );
    widgets.add(
      ModelCardWidget(
          name: 'Widget',
          icon: Icon(Icons.settings),
          boxColor: Colors.green,
          navPath: '/',
      ),
    );

    return widgets;
  }
}