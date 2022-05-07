import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/indentity/bindings/indentity_binding.dart';
import '../modules/indentity/views/indentity_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INDENTITY;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INDENTITY,
      page: () => IndentityView(),
      binding: IndentityBinding(),
    ),
  ];
}
