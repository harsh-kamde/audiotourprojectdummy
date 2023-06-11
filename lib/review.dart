import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CustomAudioPlayerWidget extends StatefulWidget {
  @override
  _CustomAudioPlayerWidgetState createState() => _CustomAudioPlayerWidgetState();
}

class _CustomAudioPlayerWidgetState extends State<CustomAudioPlayerWidget> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        // isPlaying = state == PlayerState.PLAYING;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playPauseAudio(String audioUrl) async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(audioUrl as Source);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            playPauseAudio('https://filesamples.com/samples/audio/mp3/sample3.mp3');
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Color(0xFF0079BD),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Sample Audio',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Spacer(),
                  Text(
                    '0:00 / 0:00',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
