import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:les_flutter_ui/main.dart';
import 'package:integration_test/integration_test.dart';
import 'package:les_flutter_ui/views/les_widgets/les_drawer_screen/les_drawer_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Find widget Container', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // await _testContainer(tester);

    // await _testWidgetCheck(tester);

    // await _testTabBar(tester);

    // await _testWidgetScroll(tester);

    await _testTextField(tester);

    // await _testDrawerScreen(tester);
  });
}

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

Future<void> _testContainer(WidgetTester tester) async {
  // Находим виджет Container и переходим в него
  expect(find.text('Container'), findsOneWidget);
  final containerWidget = find.text('Container');
  await tester.tap(containerWidget);
  await tester.pumpAndSettle();

  //Проверяем, что заголовок соответствует CONTAINER
  await tester.pump();
  final Finder containerHeader =
      find.byKey(ValueKey('scaffoldContainerScreen'));
  expect(containerHeader, findsOneWidget);

  // Нажимаем на стандратную кнопку "Назад"
  await tester.tap(find.byType(BackButton));
  // await tester.tap(find.byTooltip('Back'));
  await tester.pumpAndSettle();
}

Future<void> _testTabBar(WidgetTester tester) async {
  // Находим виджет TapBar и переходим в него
  expect(find.text('TapBar'), findsOneWidget);
  final tapBarWidget = find.text('TapBar');
  await tester.tap(tapBarWidget);
  await tester.pumpAndSettle();

  //await tester.pump();

  // Проверяем, что заголовок экрана соответствует TAB BAR
  final Finder tabBarHeader = find.byKey(ValueKey('tabBarScreen'));
  expect(tabBarHeader, findsOneWidget);

  // Проверяем, что на экране отображен Tab 1 и не отображены Tab 2 и Tab 3
  expect(find.text('Tab 1'), findsOneWidget);
  expect(find.text('Tab 2'), findsNothing);
  expect(find.text('Tab 3'), findsNothing);

  // Ищем иконку с изображением людей и кликаем на нее. Ждем окончание анимации
  final Finder peopleIcon = find.byKey(ValueKey('peopleIcon'));
  await tester.tap(peopleIcon);
  await tester.pumpAndSettle();
  // Проверяем, что на экране отображен Tab 2 и не отображены Tab 1 и Tab 3
  expect(find.text('Tab 2'), findsOneWidget);
  expect(find.text('Tab 1'), findsNothing);
  expect(find.text('Tab 3'), findsNothing);

  // Ищем иконку в виде домика и кликаем на нее. Ждем окончание анимации
  final Finder homeIcon = find.byKey(ValueKey('homeIcon'));
  await tester.tap(homeIcon);
  await tester.pumpAndSettle();
  // Проверяем, что на экране отображен Tab 3 и не отображены Tab 2 и Tab 1
  expect(find.text('Tab 3'), findsOneWidget);
  expect(find.text('Tab 1'), findsNothing);
  expect(find.text('Tab 2'), findsNothing);

  // Ищем иконку в виде книги и кликаем на нее. Ждем окончание анимации
  final Finder bookIcon = find.byKey(ValueKey('bookIcon'));
  await tester.tap(bookIcon);
  await tester.pumpAndSettle();
  // Проверяем, что на экране отображен Tab 1 и не отображены Tab 2 и Tab 3
  expect(find.text('Tab 1'), findsOneWidget);
  expect(find.text('Tab 2'), findsNothing);
  expect(find.text('Tab 3'), findsNothing);

  // Ищем все виджеты с типом Scrollable
  final listFinder = find.byType(Scrollable);

  // Скроллим экран до обнаружения Tab 2
  final tabTwoFinder = find.byKey(const ValueKey('Tab_2'));
  await tester.scrollUntilVisible(tabTwoFinder, 500.0, scrollable: listFinder);
  expect(tabTwoFinder, findsOneWidget);

  // Скроллим экран до обнаружения Tab 3
  final tabThreeFinder = find.byKey(const ValueKey('Tab_3'));
  await tester.scrollUntilVisible(tabThreeFinder, 500.0,
      scrollable: listFinder);
  expect(tabThreeFinder, findsOneWidget);

  // Скроллим экран до обнаружения Tab 2
  await tester.scrollUntilVisible(tabTwoFinder, -500.0, scrollable: listFinder);
  expect(tabTwoFinder, findsOneWidget);

  // Скроллим экран до обнаружения Tab 1
  final tabOneFinder = find.byKey(const ValueKey('Tab_1'));
  await tester.scrollUntilVisible(tabOneFinder, -500.0, scrollable: listFinder);
  expect(tabOneFinder, findsOneWidget);

  // Нажимаем на стандартную кнопку "Назад" и ждем окончания анимации
  await tester.tap(find.byType(BackButton));
  // await tester.tap(find.byTooltip('Back'));
  await tester.pumpAndSettle();

  // Проверяем, что отображен mainScreen
  expect(find.text('Flutter widgets'), findsOneWidget);
}

Future<void> _testWidgetScroll(WidgetTester tester) async {
  //Пролистываем главный экран вниз
  await tester.drag(find.byType(ListView).first, const Offset(0, -500));
  await tester.pumpAndSettle();

  // Находим горизонтальный ListView внутри UI-kits
  final horizontalListViews = find.byWidgetPredicate(
    (widget) => widget is ListView && widget.scrollDirection == Axis.horizontal,
  );
  final kitsListView =
      horizontalListViews.at(0); // Второй горизонтальный ListView

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

Future<void> _testDrawerScreen(WidgetTester tester) async {
  expect(find.text('Drawer'), findsOneWidget);
  final drawerWidget = find.text('Drawer');
  await tester.tap(drawerWidget);
  await tester.pumpAndSettle();

  expect(find.byType(BackButton), findsOneWidget);

  final Finder drawerHeader = find.byKey(ValueKey('DRAWER'));
  expect(drawerHeader, findsOneWidget);

  //final menuButton = find.byTooltip('Open navigation menu');
  final menuButton = find.byIcon(Icons.menu);
  expect(menuButton, findsOneWidget);
  await tester.tap(menuButton);
  await tester.pumpAndSettle();
  expect(find.text('Основное'), findsOneWidget);
  expect(find.text('Раздел 1'), findsOneWidget);
  expect(find.text('Раздел 2'), findsOneWidget);
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
  final menuButton = find.byIcon(Icons.menu);
  expect(menuButton, findsOneWidget);
  await tester.tap(menuButton);
  await tester.pumpAndSettle();
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

Future<void> _testSwipe(WidgetTester tester) async {
  final screenWidth = tester.binding.window.physicalSize.width;
  await tester.dragFrom(
    const Offset(0, 300), // Старт у левого края
    Offset(screenWidth * 0.7, 0), // Двигаем вправо
  );
  await tester.pumpAndSettle(Duration(seconds: 2));
}

Future<void> _testTextField(WidgetTester tester) async {
  expect(find.text('TextField'), findsOneWidget);
  await tester.tap(find.text('TextField'));
  await tester.pumpAndSettle();
  expect(find.byKey(ValueKey('TextFieldHeader')), findsOneWidget);
  expect(find.byType(BackButton), findsOneWidget);
  expect(find.text('Сколько денег у Вас на счету?'), findsOneWidget);
  expect(find.text('Опишите свою жизнь в пяти предложениях'), findsOneWidget);
  expect(find.text('Автор'), findsOneWidget);
  expect(find.text('Васильев Никита Сергеевич'), findsOneWidget);
  expect(find.text('Поиск...'), findsOneWidget);
  expect(find.text('Выберите диапазон дат'), findsOneWidget);
}
