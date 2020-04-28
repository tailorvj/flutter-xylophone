# Xylophone 🎹

## Passing parameters to a Flutter StatelessWidget

This app demonstrates the use of custom Flutter Stateless Widget classes with a Constructor that gets data parameters.

Another important part of this code is the use of List and Map variables and the .map() and toList() methods.

Full practical code analysis below. 

## What does the app do?

It's a simple music app that plays Xylophone sounds. 

![Finished App](https://github.com/londonappbrewery/Images/blob/master/xylophone-flutter.png)

## App structure

### pubspec.yaml

```yaml
dependencies:
 audioplayers: ^0.15.1
 pigment: ^1.0.3

flutter:
 assets:
   - assets/
```

### assets/notex.wav

The assets folder holds 7 wav files named 'note1.wav', 'note2.wav, ... up to 'note7.wav'.

### lib/main.dart

```dart
import 'package:flutter/material.dart';
import 'XylophoneApp.dart';
 
void main() => runApp(XylophoneApp());
```

### lib/XylophoneApp.dart

#### Imported libraries and class name

```dart
import 'package:flutter/material.dart';
import 'Xylophone.dart';
 
class XylophoneApp extends StatelessWidget {
```

#### Data constants (final)

```dart
final List notes = [];
final List colors = ['red', 'orange', 'yellow', 'green', 'teal', 'blue', 'purple'];
final Map notesAndColors = {};
```

#### Data building iterator methods

```dart
void buildNoteList(){
 for (var i=0; i < colors.length; i++){
   notes.add('note${i+1}.wav');
 }
}
 
void buildNotesAndColorsMap(){
 notesAndColors.addEntries(
   (Map.fromIterables(colors, notes)).entries
 );
}
```

#### Constructor

```dart
XylophoneApp(){
 buildNoteList();
 buildNotesAndColorsMap();
}
```

We build notesAndColors Map from 2 Lists and transfer it to the Xylophone widget as a parameter.

#### Widget build method override

```dart
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
```

### lib/Xylophone.dart

Imports and class name

```dart
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:pigment/pigment.dart';
 
class Xylophone extends StatelessWidget{
```

#### Data constant (final) and a static AudioCache class

```dart
 final Map notesAndColors;
 static AudioCache player = AudioCache();
```
#### Constructor receive parameter with notesAndColor Map

```dart
 Xylophone(this.notesAndColors);
 ```

#### Widget build method override

```dart
 @override
 Widget build(BuildContext context) {
   return
     Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: xylophoneKeyList(),
     );
 }
 ```

#### List xylophoneKeyList() method returns a List of Widgets to the Column children: property

```dart
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
 ```

##### List xylophoneKeyList() method details

* notesAndColors is a Map.
We are running a .map() function over its’ keys (Iterable). Each key is available to the iterator function, so we can use $key as a variable parameter as needed. 
* The return value is converted to a List using .toList() and then returned by the xylophoneKeyList() method as * List of Widgets to the children property of the Column.
* Each of the Widgets in the List is an Expanded WIdget that holds a FlatButton. 
* FlatButton gets its color from Pigment.fromString(‘$key’). This is where Pigment shines. 
* Since each entry in notesAndColors is {‘color’: ‘notex.wav’}, we can use the following onPress function callback To play the right note for each key. 

```dart
onPressed: () => player.play('${notesAndColors[key]}'),
```

## Source

This code is based on a tutorial by @londonappbrewery
Origin: https://github.com/londonappbrewery/xylophone-flutter

It implements the same app, but in a different way that emphasizes the use of your own Stateless Widgets that receive data parameters. 

Cheers, @tailorvj

