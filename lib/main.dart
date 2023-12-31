import 'package:dicionario_desafio/bindings/binding.dart';
import 'package:dicionario_desafio/env/env.dart';
import 'package:dicionario_desafio/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dicionario',
      initialBinding: AppBindings(),
      theme: appTheme,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.initialPage,
    );
  }
}
