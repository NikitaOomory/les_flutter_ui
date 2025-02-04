import 'package:flutter/material.dart'; // Импортируем пакет Material для использования основных компонентов Flutter.

class LesDrawerScreen extends StatefulWidget {
  // Определяем StatefulWidget для экрана с Drawer.

// Создаем State для состояния данного экрана.
  @override
  State<StatefulWidget> createState() => _LesDrawerScreen();
}

// State класс для управления состоянием LesDrawerScreen.
class _LesDrawerScreen extends State<LesDrawerScreen> {
// Метод build вызывается, чтобы построить виджет при каждом изменении состояния.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Используем Scaffold для основной структуры приложения.
      appBar: AppBar(
        // Создаем AppBar в верхней части экрана.
        title: Text('DRAWER'), // Заголовок на AppBar.
        centerTitle: true, // Центрируем заголовок.
      ),
      endDrawer: Drawer(
        // Определяем Drawer, который будет отображаться справа от AppBar.
// Если хотите, чтобы Drawer был слева, используйте параметр drawer.
        child: Container(
          // Контейнер для размещения элементов внутри Drawer.
          child: ListView(
            // Используем ListView для отображения списка элементов в Drawer.
            children: [
              DrawerHeader(
                // Заголовок Drawer.
                child: Center(
                  child: Text('Основное'), // Текст в заголовке.
                ),
              ),
              ListTile(
                // Элемент списка, который можно нажать.
                onTap: () {
                  // Обработчик нажатия на элемент списка.
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ScreenOne())); // Переход на ScreenOne при нажатии.
                },
                title: Text('Раздел 1'), // Заголовок элемента списка.
              ),
              ListTile(
                // Второй элемент списка.
                onTap: () {
                  // Обработчик нажатия на второй элемент.
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ScreenTwo())); // Переход на ScreenTwo при нажатии.
                },
                title: Text('Раздел 2'), // Заголовок второго элемента списка.
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Первый экран, отображаемый при нажатии на первый элемент меню.
class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Структура экрана.
      backgroundColor: Colors.greenAccent, // Устанавливаем цвет фона.
      body: Center(
        child: Text('ScreenOne'), // Текст, отображаемый в центре экрана.
      ),
    );
  }
}

// Второй экран, отображаемый при нажатии на второй элемент меню.
class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Структура экрана.
      backgroundColor: Colors.lightBlue, // Устанавливаем цвет фона.
      body: Center(
        child: Text('ScreenTwo'), // Текст, отображаемый в центре экрана.
      ),
    );
  }
}
