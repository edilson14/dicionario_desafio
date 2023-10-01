import 'package:dicionario_desafio/components/components.dart';
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.close,
                              semanticLabel: 'Fechar Página',
                            ),
                            onPressed: () => Get.back(),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              semanticLabel: 'Marcar como favorito',
                            ),
                            onPressed: () => Get.back(),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  color:
                                      const Color.fromARGB(255, 202, 120, 120),
                                  child: Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _wordController.currentWord.word,
                                          style: AppStyles.wordDetail,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          _wordController.pheonethic,
                                          style: AppStyles.wordDetail,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Row(
                                children: [
                                  Obx(
                                    () => IconButton(
                                      iconSize: 50,
                                      onPressed: () => _audioController
                                          .playAudio(audioUrl: ''),
                                      icon: Icon(
                                        _audioController.audioStatus ==
                                                AudioStatus.playing
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const MeaningComponent(),
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
                              'Próximo',
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
