import 'package:les_flutter_ui/views/les_container_screen/les_container_screen.dart';
import 'package:les_flutter_ui/views/les_tap_bar/les_tap_bar_screen.dart';
import 'package:les_flutter_ui/views/main_navigation_screen.dart';
import 'package:les_flutter_ui/views/ui_kits/hack_your_w.dart';

final routes = {
  '/' : (context) => MainNavigationScreen(),
  '/les_container_screen' : (context) => LesContainerScreen(),
  '/hack_your_w' : (context) => HackYourW(),
  '/les_tab_bar' : (context) => LesTapBarScreen(),
};