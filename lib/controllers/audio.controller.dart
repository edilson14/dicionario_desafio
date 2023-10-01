import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

enum AudioStatus { playing, paused }

class AudioController extends GetxController {
  final _audioStatus = AudioStatus.paused.obs;
  AudioStatus get audioStatus => _audioStatus.value;
  final AudioPlayer _audioPlayer = AudioPlayer();

  void playAudio({required String audioUrl}) async {
    _audioStatus.value = AudioStatus.paused;
    await _audioPlayer.setUrl(audioUrl);
    await _audioPlayer.play();
  }
}
