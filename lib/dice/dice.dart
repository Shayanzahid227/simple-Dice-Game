import 'dart:math';
import 'package:dice_game/core/constants/app_assest.dart';
import 'package:dice_game/core/constants/colors.dart';
import 'package:dice_game/core/constants/strings.dart';
import 'package:dice_game/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int _leftDiceNumber = 1;
  int _rightDiceNumber = 5;

  void ChangeDiceFace() {
    setState(() {
      _rightDiceNumber = Random().nextInt(6) + 1;
      _leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppAssets().diceBackPic,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Add this line
          mainAxisAlignment: MainAxisAlignment.start, //change to start.
          children: [
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "D i c e  G a m e",
                style: style25B.copyWith(color: Colors.red),
              ),
            ),
            Expanded(
              //add expanded widget to the rest of the column.
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                "${staticAssets}/dice$_leftDiceNumber.png",
                                color: Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                "${staticAssets}/dice$_rightDiceNumber.png",
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          ChangeDiceFace();
                        },
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              // gradient background.
                              colors: [Colors.red, Colors.purple],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 10, color: Colors.transparent),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _leftDiceNumber == _rightDiceNumber
                                      ? 'Hurrah, you win !,'
                                      : 'S c r o l l ',
                                  style: style25B.copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
