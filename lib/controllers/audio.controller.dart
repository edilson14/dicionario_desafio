import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

enum AudioStatus { playing, paused }

class AudioController {
  final _audioStatus = AudioStatus.paused.obs;
  bool get isPlaying => _audioStatus.value == AudioStatus.playing;
  final AudioPlayer _audioPlayer = AudioPlayer();

  void playAudio() {
    _audioStatus.value = AudioStatus.paused;
  }
}
