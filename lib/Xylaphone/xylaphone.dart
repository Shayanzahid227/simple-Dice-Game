import 'package:dice_game/core/constants/app_assest.dart';
import 'package:dice_game/core/constants/colors.dart';
import 'package:dice_game/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _playSound(int soundNumber) async {
      final player = AudioPlayer();
      player.play(AssetSource('audio_assets/note$soundNumber.wav')
          //  AssetSource('assets/audio_assets/note$soundNumber.wav'),
          );
    }

    Expanded _musicButton(int number, Color color, String text) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            try {
              print('button prised ');
            } catch (e) {
              print('$e error found ');
            }
            _playSound(number);
          },
          child: Container(
            width: double.infinity,
            color: color,
            child: Center(
              child: Text(
                text,
                style: style25B.copyWith(color: whiteColor),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          //*****************************************************************************
          //      the first method is done using function
          //
          _musicButton(1, Colors.red, 'Play music 1'),
          _musicButton(2, Colors.purple, 'Play music 2'),
          _musicButton(3, Colors.teal, 'Play music 3'),
          _musicButton(4, Colors.green, 'Play music 4'),
          _musicButton(5, Colors.orange, 'Play music 5'),
          _musicButton(6, Colors.blue, 'Play music 6'),
          _musicButton(7, Colors.yellowAccent, 'Play music 7'),
          //*****************************************************************************
          //  the second method is using custom widget
          //
          // Expanded(
          //   child: Container(
          //     height: 125,
          //     width: double.infinity,
          //     color: Colors.red,
          //     child: musicButton(
          //       path: AppAssets().note1,
          //       title: 'Play music 1',
          //       color: Colors.red,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     height: 125,
          //     width: double.infinity,
          //     color: Colors.purple,
          //     child: musicButton(
          //       path: AppAssets().note2,
          //       title: 'Play music 2',
          //       color: Colors.purple,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     height: 125,
          //     width: double.infinity,
          //     color: Colors.red,
          //     child: musicButton(
          //       path: AppAssets().note3,
          //       title: 'Play music 3',
          //       color: Colors.pink,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: double.infinity,
          //     height: 125,
          //     color: Colors.orange,
          //     child: musicButton(
          //       path: AppAssets().note4,
          //       title: 'Play music 4',
          //       color: Colors.orange,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     height: 125,
          //     width: double.infinity,
          //     color: Colors.teal,
          //     child: musicButton(
          //       path: AppAssets().note5,
          //       title: 'Play music 5',
          //       color: Colors.teal,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     height: 125,
          //     width: double.infinity,
          //     color: Colors.greenAccent,
          //     child: musicButton(
          //       path: AppAssets().note6,
          //       title: 'Play music 6',
          //       color: Colors.greenAccent,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     height: 125,
          //     width: double.infinity,
          //     color: Colors.blue,
          //     child: musicButton(
          //       path: AppAssets().note7,
          //       title: 'Play music 7',
          //       color: Colors.blue,
          //     ),
          //   ),
          // ),
          //*****************************************************************************
          //      method 3 using custom widget
          //
          // musicButton(
          //     path: AppAssets().note1,
          //     title: 'Music Button 1',
          //     color: Colors.red),
          // musicButton(
          //     path: AppAssets().note2,
          //     title: 'Music Button 2',
          //     color: Colors.pink),
          // musicButton(
          //     path: AppAssets().note3,
          //     title: 'Music Button 3',
          //     color: Colors.teal),
          // musicButton(
          //     path: AppAssets().note4,
          //     title: 'Music Button 4',
          //     color: Colors.purple),
          // musicButton(
          //     path: AppAssets().note5,
          //     title: 'Music Button 5',
          //     color: Colors.yellow),
          // musicButton(
          //     path: AppAssets().note6,
          //     title: 'Music Button 6',
          //     color: Colors.orange),
          // musicButton(
          //     path: AppAssets().note7,
          //     title: 'Music Button 7',
          //     color: Colors.blue),
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
    return Expanded(
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color!),
          ),
          onPressed: () async {
            try {
              final player = AudioPlayer();
              await player.play(
                position: Duration(milliseconds: 10),
                //   AssetSource('assets/audio_assets/note1.wav'),
                AssetSource(path!),
              ); // or mp3
            } catch (e) {
              print('Audio playback error: $e');
            }
          },
          child: Text(
            title!,
            style: style25B.copyWith(color: whiteColor),
          ),
        ),
      ),
    );
  }
}
