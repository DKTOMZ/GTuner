import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:GTuner/screens/tools/tools_chords.dart';

import '../main.dart';

Widget showChords(List changingChords) {
  return Obx(
    () => CarouselSlider(
      items: changingChords.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SvgPicture.asset(
                  i,
                  color: Colors.amber.shade700,
                ));
          },
        );
      }).toList(),
      options: CarouselOptions(height: 300, enableInfiniteScroll: false),
    ),
  );
}

List<DropdownMenuItem<String>> get notes {
  List<DropdownMenuItem<String>> notes = const [
    DropdownMenuItem(
      child: Text('C'),
      value: 'C',
    ),
    DropdownMenuItem(
      child: Text('C#'),
      value: 'C#',
    ),
    DropdownMenuItem(
      child: Text('D'),
      value: 'D',
    ),
    DropdownMenuItem(
      child: Text('D#'),
      value: 'D#',
    ),
    DropdownMenuItem(
      child: Text('E'),
      value: 'E',
    ),
    DropdownMenuItem(
      child: Text('F'),
      value: 'F',
    ),
    DropdownMenuItem(
      child: Text('F#'),
      value: 'F#',
    ),
    DropdownMenuItem(
      child: Text('G'),
      value: 'G',
    ),
    DropdownMenuItem(
      child: Text('G#'),
      value: 'G#',
    ),
    DropdownMenuItem(
      child: Text('A'),
      value: 'A',
    ),
    DropdownMenuItem(
      child: Text('A#'),
      value: 'A#',
    ),
    DropdownMenuItem(
      child: Text('B'),
      value: 'B',
    ),
  ];
  return notes;
}

List<DropdownMenuItem<String>> get chordTypes {
  List<DropdownMenuItem<String>> chordTypes = const [
    DropdownMenuItem(
      child: Text('Maj'),
      value: 'Maj',
    ),
    DropdownMenuItem(
      child: Text('min'),
      value: 'min',
    ),
    DropdownMenuItem(
      child: Text('Maj7'),
      value: 'Maj7',
    ),
    DropdownMenuItem(
      child: Text('min7'),
      value: 'min7',
    ),
    DropdownMenuItem(
      child: Text('sus2'),
      value: 'sus2',
    ),
    DropdownMenuItem(
      child: Text('sus4'),
      value: 'sus4',
    ),
    DropdownMenuItem(
      child: Text('add9'),
      value: 'add9',
    ),
    DropdownMenuItem(
      child: Text('7'),
      value: '7',
    ),
    DropdownMenuItem(
      child: Text('5'),
      value: '5',
    ),
  ];
  return chordTypes;
}

void chordList(String chordName, String chordType) {
  switch (chordName + chordType) {
    //Major
    case 'CMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/CMaj')).toList();
      break;
    case 'C#Maj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/CshMaj')).toList();
      break;
    case 'DMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/DMaj')).toList();
      break;
    case 'D#Maj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/DshMaj')).toList();
      break;
    case 'EMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/EMaj')).toList();
      break;
    case 'FMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/FMaj')).toList();
      break;
    case 'F#Maj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/FshMaj')).toList();
      break;
    case 'GMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/GMaj')).toList();
      break;
    case 'G#Maj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/GshMaj')).toList();
      break;
    case 'AMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/AMaj')).toList();
      break;
    case 'A#Maj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/AshMaj')).toList();
      break;
    case 'BMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/BMaj')).toList();
      break;

    //minor
    case 'Cmin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Cmin')).toList();
      break;
    case 'C#min':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Cshmin')).toList();
      break;
    case 'Dmin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dmin')).toList();
      break;
    case 'D#min':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dshmin')).toList();
      break;
    case 'Emin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Emin')).toList();
      break;
    case 'Fmin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fmin')).toList();
      break;
    case 'F#min':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fshmin')).toList();
      break;
    case 'Gmin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gmin')).toList();
      break;
    case 'G#min':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gshmin')).toList();
      break;
    case 'Amin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Amin')).toList();
      break;
    case 'A#min':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Ashmin')).toList();
      break;
    case 'Bmin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Bmin')).toList();
      break;

    //Maj7
    case 'CMaj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/CMaj7')).toList();
      break;
    case 'C#Maj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/CshMaj7')).toList();
      break;
    case 'DMaj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/DMaj7')).toList();
      break;
    case 'D#Maj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/DshMaj7')).toList();
      break;
    case 'EMaj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/EMaj7')).toList();
      break;
    case 'FMaj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/FMaj7')).toList();
      break;
    case 'F#Maj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/FshMaj7')).toList();
      break;
    case 'GMaj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/GMaj7')).toList();
      break;
    case 'G#Maj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/GshMaj7')).toList();
      break;
    case 'AMaj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/AMaj7')).toList();
      break;
    case 'A#Maj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/AshMaj7')).toList();
      break;
    case 'BMaj7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/BMaj7')).toList();
      break;
    default:
  }
}
