import 'package:dicionario_desafio/styles/text_tyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404',
              style: AppStyles.notFoundTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'No definitions found!',
              style: AppStyles.notFoundTitle.copyWith(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Text(
              'Sorry pal, we couldn\'t find definitions for the word you were looking for.',
            ),
            const Text(
              'You can try the search again at later time or head to the web instead.',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: TextButton(
                onPressed: () => Get.back(),
                child: const Text('Voltar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
