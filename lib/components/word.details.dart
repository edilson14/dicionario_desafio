import 'package:dicionario_desafio/components/components.dart';
import 'package:dicionario_desafio/models/models.dart';
import 'package:dicionario_desafio/styles/styles.dart';
import 'package:flutter/material.dart';

class WordDetails extends StatelessWidget {
  final Word word;
  const WordDetails({
    super.key,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(word.word),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AudioPlayerComponent()
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
    );
  }
}
