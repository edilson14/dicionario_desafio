import 'package:dicionario_desafio/components/components.dart';
import 'package:dicionario_desafio/controllers/controllers.dart';
import 'package:dicionario_desafio/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordPage extends StatelessWidget {
  WordPage({super.key});

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
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Flexible(
                              flex: 3,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  color:
                                      const Color.fromARGB(255, 202, 120, 120),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _wordController.word.word,
                                        style: AppStyles.wordDetail,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        _wordController.word.pheonetic,
                                        style: AppStyles.wordDetail,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Obx(
                                () => _wordController.word.audiourl.isNotEmpty
                                    ? Row(
                                        children: [
                                          IconButton(
                                            iconSize: 50,
                                            onPressed: () =>
                                                _wordController.playAudio(),
                                            icon: Icon(
                                              _wordController.audioStatus ==
                                                      AudioStatus.playing
                                                  ? Icons.pause
                                                  : Icons.play_arrow,
                                            ),
                                          ),
                                          Slider(
                                            value: 0,
                                            max: 0.1,
                                            onChanged: (double value) {},
                                          )
                                        ],
                                      )
                                    : const Center(
                                        child: Text(
                                          'Não possui audio',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                              ),
                            ),
                            Flexible(
                              flex: 0,
                              child: MeaningComponent(
                                meaning: _wordController.word.meanings,
                              ),
                            ),
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
