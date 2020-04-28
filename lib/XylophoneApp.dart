import 'package:flutter/material.dart';
import 'Xylophone.dart';

class XylophoneApp extends StatelessWidget {

final List notes = [];
final List colors = ['red', 'orange', 'yellow', 'green', 'teal', 'blue', 'purple'];
final Map notesAndColors = {};

XylophoneApp(){
  buildNoteList();
  buildNotesAndColorsMap();
}

void buildNoteList(){
  for (var i=0;i < colors.length; i++){
    notes.add('note${i+1}.wav');
  }
}

void buildNotesAndColorsMap(){
  notesAndColors.addEntries(
    (Map.fromIterables(colors, notes)).entries
  );
}

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Xylophone(notesAndColors),
        ),
      ),
    );
  }
}
