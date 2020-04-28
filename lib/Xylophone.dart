import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:pigment/pigment.dart';

class Xylophone extends StatelessWidget{
  final Map notesAndColors;
  static AudioCache player = AudioCache();

  Xylophone(this.notesAndColors);
  
  @override
  Widget build(BuildContext context) {
    return 
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: xylophoneKeyList(),
      );
  }

  List xylophoneKeyList(){
    return notesAndColors.keys.map(
      (key) => Expanded(
        child: FlatButton(
          color: Pigment.fromString('$key'),
          child: Text(''),
          onPressed: () => player.play('${notesAndColors[key]}'),
          ),
        ),
    ).toList();
  }

  // List mapNotesAndColorsToList(){
  //   return notesAndColors.keys.map(
  //     (key) => Expanded(
  //       child: FlatButton(
  //         key: notesAndColors[key],
  //         color: Pigment.fromString(notesAndColors[key]),
  //         onPressed: () => player.play(key),
  //         child: Text(key.toString()),
  //       ),
  //     )).toList();
  // }
}



