import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

enum AudioStatus { playing, paused }

class AudioController extends GetxController {
  final _audioStatus = AudioStatus.paused.obs;
  AudioStatus get audioStatus => _audioStatus.value;
  final AudioPlayer _audioPlayer = AudioPlayer();

  void playAudio({required String audioUrl}) {
    _audioStatus.value = AudioStatus.paused;
  }
}
