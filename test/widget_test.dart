import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:les_flutter_ui/main.dart';
import 'package:integration_test/integration_test.dart';
import 'package:les_flutter_ui/views/les_widgets/les_drawer_screen/les_drawer_screen.dart';
import 'package:les_flutter_ui/views/les_widgets/les_text_field_screen/les_text_field_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Find widget Container', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // await _testContainer(tester);

    await _testWidgetCheck(tester);

    // await _testTabBar(tester);

    // await _testWidgetScroll(tester);

    // await _testTextField(tester);

    // await _testDrawerScreen(tester);
    // await _testNewDrawer(tester);
  });
}

// Проверка отображения виджетов при первоначальном открытии приложении
Future<void> _testWidgetCheck(WidgetTester tester) async {
  // Проверяем отображение виджетов на экране
  expect(find.text('МКСКОМ'), findsNWidgets(2));
  expect(find.text('Widget'), findsWidgets);
  expect(find.text('Мелиорация'), findsOneWidget);
  expect(find.text('ЭПК'), findsOneWidget);
  expect(find.text('30М'), findsOneWidget);

  // Проверяем, что виджет "Семеноводство" не отображается на экране
  expect(find.text('Семеноводство'), findsNothing);
}

// Проверка экрана виджета Container
Future<void> _testContainer(WidgetTester tester) async {
  // Находим виджет Container и переходим в него
  expect(find.text('Container'), findsOneWidget);
  final containerWidget = find.text('Container');
  await tester.tap(containerWidget);
  await tester.pumpAndSettle();

  //Проверяем, что заголовок соответствует CONTAINER
  await tester.pump();
  final Finder containerHeader = find.byKey(Key('scaffoldContainerScreen'));
  expect(containerHeader, findsOneWidget);

  // Нажимаем на стандратную кнопку "Назад"
  await tester.tap(find.byType(BackButton));
  // await tester.tap(find.byTooltip('Back'));
  await tester.pumpAndSettle();
  expect(find.text('Flutter widgets'), findsOneWidget);

  // await tester.tap(containerWidget);
  // await tester.pumpAndSettle();
  // expect(containerHeader, findsOneWidget);
  // // await _testAndroidSwipe(tester);
  // await _testAndroidSwipe(tester);
  // await _testSwipe(tester);
  // expect(find.text('Flutter widgets'), findsOneWidget);
}

// Проверка экрана виджета TabBar
Future<void> _testTabBar(WidgetTester tester) async {
  // Находим виджет TapBar и переходим в него
  expect(find.text('TapBar'), findsOneWidget);
  final tapBarWidget = find.text('TapBar');
  await tester.tap(tapBarWidget);
  await tester.pumpAndSettle();

  //await tester.pump();

  // Проверяем, что заголовок экрана соответствует TAB BAR
  final Finder tabBarHeader = find.byKey(Key('tabBarScreen'));
  expect(tabBarHeader, findsOneWidget);

  // Проверяем, что на экране отображен Tab 1 и не отображены Tab 2 и Tab 3
  expect(find.text('Tab 1'), findsOneWidget);
  expect(find.text('Tab 2'), findsNothing);
  expect(find.text('Tab 3'), findsNothing);

  // Ищем иконку с изображением людей и кликаем на нее. Ждем окончание анимации
  final Finder peopleIcon = find.byKey(Key('peopleIcon'));
  await tester.tap(peopleIcon);
  await tester.pumpAndSettle();

  // Проверяем, что на экране отображен Tab 2 и не отображены Tab 1 и Tab 3
  expect(find.text('Tab 2'), findsOneWidget);
  expect(find.text('Tab 1'), findsNothing);
  expect(find.text('Tab 3'), findsNothing);

  // Ищем иконку в виде домика и кликаем на нее. Ждем окончание анимации
  final Finder homeIcon = find.byKey(Key('homeIcon'));
  await tester.tap(homeIcon);
  await tester.pumpAndSettle();

  // Проверяем, что на экране отображен Tab 3 и не отображены Tab 2 и Tab 1
  expect(find.text('Tab 3'), findsOneWidget);
  expect(find.text('Tab 1'), findsNothing);
  expect(find.text('Tab 2'), findsNothing);

  // Ищем иконку в виде книги и кликаем на нее. Ждем окончание анимации
  final Finder bookIcon = find.byKey(Key('bookIcon'));
  await tester.tap(bookIcon);
  await tester.pumpAndSettle();

  // Проверяем, что на экране отображен Tab 1 и не отображены Tab 2 и Tab 3
  expect(find.text('Tab 1'), findsOneWidget);
  expect(find.text('Tab 2'), findsNothing);
  expect(find.text('Tab 3'), findsNothing);

  // Ищем все виджеты с типом Scrollable
  final listFinder = find.byType(Scrollable);

  // Скроллим экран до обнаружения Tab 2
  final tabTwoFinder = find.byKey(const Key('Tab_2'));
  await tester.scrollUntilVisible(tabTwoFinder, 500.0, scrollable: listFinder);
  expect(tabTwoFinder, findsOneWidget);

  // Скроллим экран до обнаружения Tab 3
  final tabThreeFinder = find.byKey(const Key('Tab_3'));
  await tester.scrollUntilVisible(tabThreeFinder, 500.0,
      scrollable: listFinder);
  expect(tabThreeFinder, findsOneWidget);

  // Скроллим экран до обнаружения Tab 2
  await tester.scrollUntilVisible(tabTwoFinder, -500.0, scrollable: listFinder);
  expect(tabTwoFinder, findsOneWidget);

  // Скроллим экран до обнаружения Tab 1
  final tabOneFinder = find.byKey(const Key('Tab_1'));
  await tester.scrollUntilVisible(tabOneFinder, -500.0, scrollable: listFinder);
  expect(tabOneFinder, findsOneWidget);

  // Нажимаем на стандартную кнопку "Назад" и ждем окончания анимации
  await tester.tap(find.byType(BackButton));
  // await tester.tap(find.byTooltip('Back'));
  await tester.pumpAndSettle();

  // Проверяем, что отображен mainScreen
  expect(find.text('Flutter widgets'), findsOneWidget);
}

// Проверка скролла до виджета "Семеноводство" на mainscreen
Future<void> _testWidgetScroll(WidgetTester tester) async {
  //Пролистываем главный экран вниз
  await tester.drag(find.byType(ListView).first, const Offset(0, -500));
  await tester.pumpAndSettle();

  // Находим горизонтальный ListView внутри UI-kits
  final horizontalListViews = find.byWidgetPredicate(
    (widget) => widget is ListView && widget.scrollDirection == Axis.horizontal,
  );
  final kitsListView = horizontalListViews
      .at(0); // Первый горизонтальный ListView отображаемый на экране

  // Скроллим горизонтальный список вправо (drag влево)
  await tester.drag(kitsListView, const Offset(-5000, 0));
  await tester.pumpAndSettle();

  // Проверяем наличие элемента
  expect(find.text('Семеноводство'), findsOneWidget);
  expect(find.text('Мелиорация'), findsNothing);

  // Пролистываем main screen вверх и проверяем, что на экране отображется виджет Flutter widgets
  await tester.drag(find.byType(ListView).first, const Offset(0, 500));
  await tester.pumpAndSettle();
  expect(find.text('Flutter widgets'), findsOneWidget);
}

// Проверка экрана DrawerScreen (не дописано, проблема со свайпом)
Future<void> _testDrawerScreen(WidgetTester tester) async {
  // Находим виджет Drawer, тапаем на него и ждем окончание анимации
  expect(find.text('Drawer'), findsOneWidget);
  final drawerWidget = find.text('Drawer');
  await tester.tap(drawerWidget);
  await tester.pumpAndSettle();

  // Находим стандартную кнопку "Назад"
  expect(find.byType(BackButton), findsOneWidget);

  // Находим хедер экрана по ключу
  final Finder drawerHeader = find.byKey(ValueKey('DRAWER'));
  expect(drawerHeader, findsOneWidget);

  // Находим menu button, нажимае на нее и ждем окончание анимации
  //final menuButton = find.byTooltip('Open navigation menu');
  final menuButton = find.byIcon(Icons.menu);
  expect(menuButton, findsOneWidget);
  await tester.tap(menuButton);
  await tester.pumpAndSettle();

  // Проверяем отображение элементов в открывшемся боковом сайдбаре
  expect(find.text('Основное'), findsOneWidget);
  expect(find.text('Раздел 1'), findsOneWidget);
  expect(find.text('Раздел 2'), findsOneWidget);

  // Нажимаем на элемент "Раздел 1", ждем окончание анимации, проверяем, что мы перешли к экрану ScreenOne
  await tester.tap(find.text('Раздел 1'));
  await tester.pumpAndSettle();
  expect(find.text('ScreenOne'), findsOneWidget);

  await _testAndroid(tester);

  await _testSwipe(tester);

  expect(find.text('ScreenOne'), findsNothing);

  // Проверка, что вернулись на экран с Drawer
  expect(find.text('DRAWER'), findsOneWidget);
  expect(menuButton, findsOneWidget);
  expect(find.text('Основное'), findsNothing);

  await _testDrawerSecond(tester);
}

Future<void> _testDrawerSecond(WidgetTester tester) async {
  // Находим menu button, тапаем на него и ждем окончание анимации
  final menuButton = find.byIcon(Icons.menu);
  expect(menuButton, findsOneWidget);
  await tester.tap(menuButton);
  await tester.pumpAndSettle();

  // Тапаем на элемент "Раздел 2", ждем окончание анимации, проверяем, что перешли к экрану ScreenTwo
  await tester.tap(find.text('Раздел 2'));
  await tester.pumpAndSettle();
  expect(find.text('ScreenTwo'), findsOneWidget);

  // final screenWidth = tester.binding.window.physicalSize.width;
  // await tester.dragFrom(
  //   const Offset(0, 300), // Старт у левого края
  //   Offset(screenWidth * 0.7, 0), // Двигаем вправо
  // );
  // await tester.pumpAndSettle(Duration(seconds: 2));
  await _testSwipe(tester);

  expect(find.text('ScreenTwo'), findsNothing);

  // Проверка, что вернулись на экран с Drawer
  expect(find.text('Основное'), findsOneWidget);
  expect(find.text('DRAWER'), findsOneWidget);

  // expect(find.byType(BackButton), findsOneWidget);
  // await tester.tap(find.byTooltip('Back'));
  // await tester.pumpAndSettle();
  // // Проверяем, что отображен mainScreen
  // expect(find.text('UI-kit'), findsOneWidget);
}

// Свайп на Android с ипользованием iOS-анимации
Future<void> _testAndroid(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: ThemeData(
        platform: TargetPlatform.android,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: LesDrawerScreen(),
    ),
  );
}

// Future<void> _testSwipe(WidgetTester tester) async {
//   final screenWidth = tester.binding.window.physicalSize.width;
//   await tester.dragFrom(
//     const Offset(0, 300), // Старт у левого края
//     Offset(screenWidth * 0.7, 0), // Двигаем вправо
//   );
//   await tester.pumpAndSettle(Duration(seconds: 2));
// }

// Text Fields tests
Future<void> _testTextField(WidgetTester tester) async {
  // Находим виджет TextField, тапаем по нему, ждем окончание анимации
  expect(find.text('TextField'), findsOneWidget);
  await tester.tap(find.text('TextField'));
  await tester.pumpAndSettle();

  // Проверяем отображение хедера и стандартной кнопки "Назад"
  expect(find.byKey(Key('TextFieldHeader')), findsOneWidget);
  expect(find.byType(BackButton), findsOneWidget);

  // Проводим проверки всех поле с типом TextField на экране
  await _testMyTextField(tester);
  await _testMyBigTextField(tester);
  await _testMyDisableTextField(tester);
  await _testMySearchTextField(tester);
  await _testDatePicker(tester);

  // Тапаем по стандартной кнопке "Назад", ждем окончание анимации, проверяем, что вернулись к экрану mainscreen
  await tester.tap(find.byType(BackButton));
  await tester.pumpAndSettle();
  expect(find.text('Flutter widgets'), findsOneWidget);
}

Future<void> _testMyTextField(WidgetTester tester) async {
  // Проверка наличия виджетов на экране
  expect(find.text('Сколько денег у Вас на счету?'), findsOneWidget);
  expect(find.text('руб.'), findsOneWidget);
  expect(find.text('10000'), findsOneWidget);
  expect(find.byKey(Key('accountBalanceWalletRoundedIcon')), findsOneWidget);
  expect(find.byKey(Key('monetizationOnOutlinedIcon')), findsOneWidget);
  final myTextField = find.byKey(Key(
      'myTextField')); // нужен ли здесь const перед Key final textField = find.byKey(const Key('myTextField'));

  // Проверяем поведение поля, когда фокус установлен на нем
  await _testFocusMyTextField(tester);

  // Вводим текст с валидным значением
  await tester.enterText(myTextField, '35');

  // Проверяем, что введенное значение отображено на экране
  expect(find.text('35'), findsOneWidget);

  // Очищаем поле от ранее введенного значения
  await tester.enterText(find.byKey(Key('myTextField')), ''); // Пустая строка

  // Проверяем очистку
  expect(find.text('35'), findsNothing);

  // Вводим текст с невалидным значением и проверяем, что невалидное значение не отображено на экране
  await tester.enterText(myTextField, 'test');
  expect(find.text('test'), findsNothing);
}

Future<void> _testFocusMyTextField(WidgetTester tester) async {
  // Находим TextField по ключу
  final textFieldFinder = find.byKey(const ValueKey('myTextField'));
  final TextField myTextField = tester.widget(textFieldFinder);

  // Проверяем начальное состояние (до фокусировки)
  final InputDecoration initialDecoration = myTextField.decoration!;

  // Проверка рамки
  expect(
    (initialDecoration.enabledBorder! as OutlineInputBorder).borderRadius,
    const BorderRadius.all(Radius.circular(30)),
  );

  // Проверка цвета текста label
  expect(
    initialDecoration.labelStyle!.color,
    equals(Colors.grey.shade300),
  );

  // Тапаем для фокусировки
  await tester.tap(textFieldFinder);
  await tester.pumpAndSettle(); // Ожидаем анимации

  // Получаем обновленный виджет после фокусировки
  final TextField focusedTextField = tester.widget(textFieldFinder);
  final InputDecoration focusedDecoration = focusedTextField.decoration!;

  // Проверка измененной рамки
  expect(
    (focusedDecoration.focusedBorder! as OutlineInputBorder).borderRadius,
    const BorderRadius.all(Radius.circular(0)),
  );

  // Проверка цвета floating label
  expect(
    focusedDecoration.floatingLabelStyle!.color,
    equals(Colors.green),
  );
}

Future<void> _testMyBigTextField(WidgetTester tester) async {
  // Проверяем наличие элементов для MyBigTextField
  final myBigTextField = find.byKey(Key('myBigTextField'));
  expect(find.text('Опишите свою жизнь в пяти предложениях'), findsOneWidget);
  expect(find.byKey(Key('contactPageRoundedIcon')), findsOneWidget);
  expect(find.text('Я живу так...'), findsOneWidget);

  // Проверяем поведение поля, когда фокус установлен на нем
  await _testFocusMyBigTestField(tester);

  // Вводим в поле значение и проверяем отображение введенного значения
  await tester.enterText(
      myBigTextField, 'Тестирование ввода текста 123!@#%^&*()-_+=~`;:');
  expect(find.text('Тестирование ввода текста 123!@#%^&*()-_+=~`;:'),
      findsOneWidget);

  // Очищаем поле от ранее введенного значения и проверяем, что ранее введенное значение на экране не найдено
  await tester.enterText(myBigTextField, '');
  expect(find.text('Тестирование ввода текста 123!@#%^&*()-_+=~`;:'),
      findsNothing);
}

Future<void> _testFocusMyBigTestField(WidgetTester tester) async {
  // Находим TextField по ключу
  final textFieldFinder = find.byKey(const ValueKey('myBigTextField'));
  final TextField myBigTextField = tester.widget(textFieldFinder);

  // Проверяем начальное состояние (до фокусировки)
  final InputDecoration initialDecoration = myBigTextField.decoration!;

  // Проверка рамки
  expect(
    (initialDecoration.enabledBorder! as OutlineInputBorder).borderRadius,
    const BorderRadius.all(Radius.circular(30)),
  );

  // Проверка цвета текста label
  expect(
    initialDecoration.labelStyle!.color,
    equals(Colors.grey.shade300),
  );

  // Тапаем для фокусировки
  await tester.tap(textFieldFinder);
  await tester.pumpAndSettle(); // Ожидаем анимации

  // Получаем обновленный виджет после фокусировки
  final TextField focusedTextField = tester.widget(textFieldFinder);
  final InputDecoration focusedDecoration = focusedTextField.decoration!;

  // Проверка измененной рамки
  expect(
    (focusedDecoration.focusedBorder! as OutlineInputBorder).borderRadius,
    const BorderRadius.all(Radius.circular(0)),
  );

  // Проверка цвета floating label
  expect(
    focusedDecoration.floatingLabelStyle!.color,
    equals(Colors.green),
  );
}

Future<void> _testMyDisableTextField(WidgetTester tester) async {
  // Проверяем наличие элементов для MyDisableTextField
  expect(find.text('Автор'), findsOneWidget);
  expect(find.text('Васильев Никита Сергеевич'), findsOneWidget);
  expect(find.byKey(Key('man')), findsOneWidget);

  // Проверяем поведение поля, когда фокус установлен на нем
  await _testFocusMyDisableTextField(tester);

  // Вводим в поле значение, проверяем, что значение введенное не отображено на экране, вместо него отображено стандартное значение
  final myDisabledTextField = find.byKey(Key('myDisableTextField'));
  await tester.enterText(myDisabledTextField, 'Testing text');
  expect(find.text('Testing text'), findsNothing);
  expect(find.text('Васильев Никита Сергеевич'), findsOneWidget);
}

Future<void> _testFocusMyDisableTextField(WidgetTester tester) async {
  // Находим TextField по ключу
  final textFieldFinder = find.byKey(const ValueKey('myDisableTextField'));
  final TextField myDisabledTextField = tester.widget(textFieldFinder);

  // Проверяем начальное состояние (до фокусировки)
  final InputDecoration initialDecoration = myDisabledTextField.decoration!;

  // Проверка рамки
  expect(
    (initialDecoration.enabledBorder! as OutlineInputBorder).borderRadius,
    const BorderRadius.all(Radius.circular(30)),
  );

  // Проверка цвета текста label
  expect(
    initialDecoration.labelStyle!.color,
    equals(Colors.grey.shade300),
  );

  // // Проверка цвета текста label
  // expect(
  //   initialDecoration.floatingLabelStyle!.color,
  //   equals(Colors.green),
  // );

  // Тапаем для фокусировки
  await tester.tap(textFieldFinder);
  await tester.pumpAndSettle(); // Ожидаем анимации

  // Получаем обновленный виджет после фокусировки
  final TextField focusedTextField = tester.widget(textFieldFinder);
  final InputDecoration focusedDecoration = focusedTextField.decoration!;

  // Проверка измененной рамки
  expect(
    (focusedDecoration.focusedBorder! as OutlineInputBorder).borderRadius,
    const BorderRadius.all(Radius.circular(0)),
  );

  // Проверка цвета floating label
  expect(
    focusedDecoration.floatingLabelStyle!.color,
    equals(Colors.green),
  );
}

Future<void> _testMySearchTextField(WidgetTester tester) async {
  // Проверяем наличие элементов для SearchTextField
  final mySearchTextField = find.byKey(Key('mySearchTextField'));
  expect(find.text('Поиск...'), findsOneWidget);
  expect(find.byKey(Key('search')), findsOneWidget);

  // Вводим в поле значение и проверяем отображение введенного значения
  await tester.enterText(
      mySearchTextField, 'Тестирование ввода текста 123!@#%^&*()-_+=~`;:');
  expect(find.text('Тестирование ввода текста 123!@#%^&*()-_+=~`;:'),
      findsOneWidget);

  // Очищаем поле от ранее введенного значения и проверяем, что ранее введенное значение на экране не найдено
  await tester.enterText(mySearchTextField, '');
  expect(find.text('Тестирование ввода текста 123!@#%^&*()-_+=~`;:'),
      findsNothing);

  // Проверяем поведение поля, когда фокус установлен на нем
  await _testFocusMySearchTextField(tester);
}

Future<void> _testFocusMySearchTextField(WidgetTester tester) async {
  // Находим TextField по ключу
  final textFieldFinder = find.byKey(const ValueKey('mySearchTextField'));
  final TextField mySearchTextField = tester.widget(textFieldFinder);

  // Проверяем начальное состояние (до фокусировки)
  final InputDecoration initialDecoration = mySearchTextField.decoration!;

  // Проверка рамки
  expect(
    (initialDecoration.enabledBorder! as OutlineInputBorder).borderRadius,
    const BorderRadius.all(Radius.circular(30)),
  );

  // Тапаем для фокусировки
  await tester.tap(textFieldFinder);
  await tester.pumpAndSettle(); // Ожидаем анимации

  // Получаем обновленный виджет после фокусировки
  final TextField focusedTextField = tester.widget(textFieldFinder);
  final InputDecoration focusedDecoration = focusedTextField.decoration!;

  // Проверка измененной рамки
  expect(
    (focusedDecoration.focusedBorder! as OutlineInputBorder).borderRadius,
    const BorderRadius.all(Radius.circular(0)),
  );
}

Future<void> _testDatePicker(WidgetTester tester) async {
  // Проверяем наличие элементов для поля с DatePicker
  expect(find.text('Выберите диапазон дат'), findsOneWidget);
  expect(find.text('Start Date'), findsNothing);
  expect(find.byKey(Key('calendarIcon')), findsOneWidget);
  final datePickerTextField = find.byKey(Key('DatePicker'));

  // Проверяем тап по полю, ждем окончание анимации, проверяем, что у нас окрылся экран с датапикером
  await tester.tap(datePickerTextField);
  await tester.pumpAndSettle();
  expect(find.text('Start Date'), findsOneWidget);

  // Ищем кнопку закрытия, тапаем по ней, ждем окончание анимации, проверяем, что экран с датапикером не отображается
  expect(find.byIcon(Icons.close), findsOneWidget);
  await tester.tap(find.byIcon(Icons.close));
  await tester.pumpAndSettle();
  expect(find.text('Start Date'), findsNothing);
}

// Проверка экрана DrawerScreen (новая версия, проблема со свайпом)
Future<void> _testNewDrawer(WidgetTester tester) async {
  await tester.tap(find.text('Drawer'));
  await tester.pumpAndSettle();

  expect(find.byKey(Key('DRAWER')), findsOneWidget);
  expect(find.byType(BackButton), findsOneWidget);

  // 1. Переход на ScreenOne
  await tester.tap(find.byIcon(Icons.menu)); // Открываем Drawer
  await tester.pumpAndSettle();
  await tester.tap(find.text('Раздел 1')); // Нажимаем пункт
  await tester.pumpAndSettle();
  expect(find.byKey(ValueKey('ScreenOne')), findsOneWidget); // Проверка экрана
  expect(find.byKey(Key('DRAWER')), findsNothing);

  // await _testAndroidSwipe(tester);
  await _testSwipe(tester);

  // Проверяем, что вернулись на главный экран
  expect(find.byKey(ValueKey('DRAWER')), findsOneWidget);
  expect(find.byKey(ValueKey('ScreenOne')), findsNothing);
  expect(find.text('Основное'), findsNothing);
  expect(find.byType(BackButton), findsOneWidget);

  // await tester.tap(find.byIcon(Icons.menu)); // Открываем Drawer
  // await tester.pumpAndSettle();
  // await tester.tap(find.text('Раздел 2')); // Нажимаем пункт
  // await tester.pumpAndSettle();
  // expect(find.byKey(ValueKey('ScreenTwo')), findsOneWidget); // Проверка экрана
  // expect(find.byKey(Key('DRAWER')), findsNothing);

  // await _testAndroidSwipe(tester);
  // await _testSwipe(tester);

  // // Проверяем, что вернулись на главный экран
  // expect(find.byKey(ValueKey('DRAWER')), findsOneWidget);
  // expect(find.byKey(ValueKey('ScreenTwo')), findsNothing);
  // expect(find.text('Основное'), findsNothing);
  // expect(find.byIcon(Icons.menu), findsOneWidget);
  // // expect(find.byType(BackButton), findsOneWidget);
}

// Свайп стиль Android
// Future<void> _testAndroidSwipe(WidgetTester tester) async {
//   await tester.pumpWidget(
//     MaterialApp(
//       theme: ThemeData(
//         platform: TargetPlatform.android, // Явно указываем платформу
//         pageTransitionsTheme: PageTransitionsTheme(
//           builders: {
//             // Используем Material-билдер для Android
//             TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//           },
//         ),
//       ),
//       home: LesDrawerScreen(),
//     ),
//   );
// }

// Свайп
Future<void> _testSwipe(WidgetTester tester) async {
  // final screenWidth = tester.binding.window.physicalSize.width;
  // await tester.dragFrom(
  //   const Offset(0, 300), // Старт у левого края
  //   Offset(screenWidth * 0.7, 0), // Двигаем вправо
  // );
  // await tester.pumpAndSettle(Duration(seconds: 2));

  final screenWidth = tester.binding.window.physicalSize.width;
  // Более точные координаты для свайпа
  await tester.dragFrom(
    Offset(0, tester.binding.window.physicalSize.height / 2),
    Offset(screenWidth * 0.8, 0), // Свайп влево для возврата
    touchSlopX: 0, // Отключаем порог срабатывания
  );
  await tester.pumpAndSettle(const Duration(seconds: 2));
}
