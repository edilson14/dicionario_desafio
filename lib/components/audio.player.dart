import 'package:dicionario_desafio/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioPlayerComponent extends StatelessWidget {
  final AudioController controller = Get.find<AudioController>();
  AudioPlayerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: controller.playAudio,
          iconSize: 50,
          icon: Obx(
            () => Icon(
              controller.audioStatus == AudioStatus.playing
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          ),
        ),
      ],
    );
  }
}