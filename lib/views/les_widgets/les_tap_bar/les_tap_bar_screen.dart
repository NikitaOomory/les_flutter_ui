import 'package:flutter/material.dart';

class LesTapBarScreen extends StatefulWidget {
  const LesTapBarScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LesTabBarScreen();
}

class _LesTabBarScreen extends State<LesTapBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //инициализируем контроллер табов для нашего экрана
      length: 3,
      //указываем количество Tabs
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('TAB BAR'),
            key: ValueKey('tabBarScreen')),
        body: Column(
          //создаём структуру Column чтобы вставить плашку с табами и главную часть отображаемого интерфейса
          children: [
            TabBar(
              //виджет который отображает сами Tabs о количеству полученному из length
              tabs: [
                Tab(
                    //один таб в панели навигации
                    icon: Icon(Icons.menu_book_outlined),
                    key: ValueKey('bookIcon')),
                Tab(icon: Icon(Icons.people_alt), key: ValueKey('peopleIcon')),
                Tab(icon: Icon(Icons.home_rounded), key: ValueKey('homeIcon')),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                //тут будет размещаться наш интерфейс в зависимости от выбранного таба
                //Tab 1
                getTab1(),
                //Tab 2
                getTab2(),
                //Tab 3
                getTab3(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Container getTab1() {
    return Container(
        color: Colors.red,
        key: ValueKey('Tab_1'),
        child: Center(
          child: Text(
            'Tab 1',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ));
  }

  Container getTab2() {
    return Container(
        color: Colors.green,
        key: ValueKey('Tab_2'),
        child: Center(
          child: Text(
            'Tab 2',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ));
  }

  Container getTab3() {
    return Container(
        color: Colors.blue,
        key: ValueKey('Tab_3'),
        child: Center(
          child: Text(
            'Tab 3',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ));
  }
}
