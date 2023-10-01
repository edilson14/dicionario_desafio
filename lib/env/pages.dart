import 'package:dicionario_desafio/bindings/binding.dart';
import 'package:dicionario_desafio/env/env.dart';
import 'package:dicionario_desafio/pages/notfound/404.page.dart';
import 'package:dicionario_desafio/pages/pages.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initialPage,
      page: () => WordsListPage(),
      binding: WordsBindings(),
    ),
    GetPage(
      name: AppRoutes.wordDetails,
      page: () => WordPage(),
      binding: WordBinding(),
    ),
    GetPage(
      name: AppRoutes.notFound,
      page: () => const NotFoundPage(),
    ),
  ];
}
