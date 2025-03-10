import 'package:dice_game/core/constants/app_assest.dart';
import 'package:dice_game/core/constants/colors.dart';
import 'package:dice_game/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> playSound(int soundNumber) async {
      final player = AudioPlayer();
      player.play(AssetSource('assets/audio_assets$soundNumber.wav'));
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 125,
              width: double.infinity,
              color: Colors.red,
              child: musicButton(
                path: AppAssets().note1,
                title: 'Play Audio 1',
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 125,
              width: double.infinity,
              color: Colors.purple,
              child: musicButton(
                path: AppAssets().note2,
                title: 'Play Audio 2',
                color: Colors.purple,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 125,
              width: double.infinity,
              color: Colors.red,
              child: musicButton(
                path: AppAssets().note3,
                title: 'Play Audio 3',
                color: Colors.pink,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 125,
              color: Colors.orange,
              child: musicButton(
                path: AppAssets().note4,
                title: 'Play Audio 4',
                color: Colors.orange,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 125,
              width: double.infinity,
              color: Colors.teal,
              child: musicButton(
                path: AppAssets().note5,
                title: 'Play Audio 5',
                color: Colors.teal,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 125,
              width: double.infinity,
              color: Colors.greenAccent,
              child: musicButton(
                path: AppAssets().note6,
                title: 'Play Audio 6',
                color: Colors.greenAccent,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 125,
              width: double.infinity,
              color: Colors.blue,
              child: musicButton(
                path: AppAssets().note7,
                title: 'Play Audio 7',
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class musicButton extends StatelessWidget {
  final String? title;
  final String? path;
  final Color? color;
  const musicButton(
      {super.key,
      required this.path,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color!),
      ),
      onPressed: () async {
        try {
          final player = AudioPlayer();
          await player.play(
              position: Duration(milliseconds: 10),
              //   AssetSource('assets/audio_assets/note1.wav'),
              AssetSource(path!)); // or mp3
        } catch (e) {
          print('Audio playback error: $e');
        }
      },
      child: Text(
        title!,
        style: style25B.copyWith(color: whiteColor),
      ),
    );
  }
}
