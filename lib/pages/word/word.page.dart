import 'package:dicionario_desafio/controllers/audio.controller.dart';
import 'package:dicionario_desafio/controllers/word.controller.dart';
import 'package:dicionario_desafio/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordPage extends StatelessWidget {
  WordPage({super.key});

  final AudioController _audioController = Get.find();
  final WordController _wordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => _wordController.loadingWord
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Get.back(),
                        ),
                      ),
                      const Text('Word Details'),
                      Expanded(
                        child: Column(
                          children: [
                            const Center(),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(
                                  () => IconButton(
                                    iconSize: 50,
                                    onPressed: () =>
                                        _audioController.playAudio(),
                                    icon: Icon(_audioController.audioStatus ==
                                            AudioStatus.playing
                                        ? Icons.pause
                                        : Icons.play_arrow),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: AppStyles.buttonStyle,
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              'Voltar',
                              style: AppStyles.textStyleButton,
                            ),
                          ),
                          TextButton(
                            style: AppStyles.buttonStyle,
                            onPressed: () {},
                            child: Text(
                              'Proximo',
                              style: AppStyles.textStyleButton,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
