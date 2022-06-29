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
          chords.where((p0) => p0.contains('images/chords/CMajor')).toList();
      break;
    case 'C#Maj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/CshMajor')).toList();
      break;
    case 'DMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/DMajor')).toList();
      break;
    case 'D#Maj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/DshMajor')).toList();
      break;
    case 'EMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/EMajor')).toList();
      break;
    case 'FMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/FMajor')).toList();
      break;
    case 'F#Maj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/FshMajor')).toList();
      break;
    case 'GMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/GMajor')).toList();
      break;
    case 'G#Maj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/GshMajor')).toList();
      break;
    case 'AMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/AMajor')).toList();
      break;
    case 'A#Maj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/AshMajor')).toList();
      break;
    case 'BMaj':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/BMajor')).toList();
      break;

    //minor
    case 'Cmin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Cminor')).toList();
      break;
    case 'C#min':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Cshminor')).toList();
      break;
    case 'Dmin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dminor')).toList();
      break;
    case 'D#min':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dshminor')).toList();
      break;
    case 'Emin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Eminor')).toList();
      break;
    case 'Fmin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fminor')).toList();
      break;
    case 'F#min':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fshminor')).toList();
      break;
    case 'Gmin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gminor')).toList();
      break;
    case 'G#min':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gshminor')).toList();
      break;
    case 'Amin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Aminor')).toList();
      break;
    case 'A#min':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Ashminor')).toList();
      break;
    case 'Bmin':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Bminor')).toList();
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

    //min7
    case 'Cmin7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Cmin7')).toList();
      break;
    case 'C#min7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Cshmin7')).toList();
      break;
    case 'Dmin7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dmin7')).toList();
      break;
    case 'D#min7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dshmin7')).toList();
      break;
    case 'Emin7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Emin')).toList();
      break;
    case 'Fmin7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fmin7')).toList();
      break;
    case 'F#min7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fshmin7')).toList();
      break;
    case 'Gmin7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gmin7')).toList();
      break;
    case 'G#min7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gshmin7')).toList();
      break;
    case 'Amin7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Amin7')).toList();
      break;
    case 'A#min7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Ashmin7')).toList();
      break;
    case 'Bmin7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Bmin7')).toList();
      break;

    //sus2
    case 'Csus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Csus2')).toList();
      break;
    case 'C#sus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Cshsus2')).toList();
      break;
    case 'Dsus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dsus2')).toList();
      break;
    case 'D#sus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dshsus2')).toList();
      break;
    case 'Esus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Esus2')).toList();
      break;
    case 'Fsus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fsus2')).toList();
      break;
    case 'F#sus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fshsus2')).toList();
      break;
    case 'Gsus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gsus2')).toList();
      break;
    case 'G#sus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gshsus2')).toList();
      break;
    case 'Asus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Asus2')).toList();
      break;
    case 'A#sus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Ashsus2')).toList();
      break;
    case 'Bsus2':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Bsus2')).toList();
      break;

    //sus4
    case 'Csus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Csus4')).toList();
      break;
    case 'C#sus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Cshsus4')).toList();
      break;
    case 'Dsus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dsus4')).toList();
      break;
    case 'D#sus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dshsus4')).toList();
      break;
    case 'Esus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Esus4')).toList();
      break;
    case 'Fsus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fsus4')).toList();
      break;
    case 'F#sus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fshsus4')).toList();
      break;
    case 'Gsus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gsus4')).toList();
      break;
    case 'G#sus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gshsus4')).toList();
      break;
    case 'Asus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Asus4')).toList();
      break;
    case 'A#sus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Ashsus4')).toList();
      break;
    case 'Bsus4':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Bsus4')).toList();
      break;

    //add9
    case 'Cadd9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Cadd9')).toList();
      break;
    case 'C#add9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Cshadd9')).toList();
      break;
    case 'Dadd9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dadd9')).toList();
      break;
    case 'D#add9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dshadd9')).toList();
      break;
    case 'Eadd9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Eadd9')).toList();
      break;
    case 'Fadd9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fadd9')).toList();
      break;
    case 'F#add9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fshadd9')).toList();
      break;
    case 'Gadd9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gadd9')).toList();
      break;
    case 'G#add9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gshadd9')).toList();
      break;
    case 'Aadd9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Aadd9')).toList();
      break;
    case 'A#add9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Ashadd9')).toList();
      break;
    case 'Badd9':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Badd9')).toList();
      break;

    //7
    case 'C7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/C7')).toList();
      break;
    case 'C#7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Csh7')).toList();
      break;
    case 'D7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/D7')).toList();
      break;
    case 'D#7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dsh7')).toList();
      break;
    case 'E7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/E7')).toList();
      break;
    case 'F7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/F7')).toList();
      break;
    case 'F#7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fsh7')).toList();
      break;
    case 'G7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/G7')).toList();
      break;
    case 'G#7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gsh7')).toList();
      break;
    case 'A7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/A7')).toList();
      break;
    case 'A#7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Ash7')).toList();
      break;
    case 'B7':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/B7')).toList();
      break;

    //5
    case 'C5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/C5')).toList();
      break;
    case 'C#5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Csh5')).toList();
      break;
    case 'D5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/D5')).toList();
      break;
    case 'D#5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Dsh5')).toList();
      break;
    case 'E5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/E5')).toList();
      break;
    case 'F5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/F5')).toList();
      break;
    case 'F#5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Fsh5')).toList();
      break;
    case 'G5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/G5')).toList();
      break;
    case 'G#5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Gsh5')).toList();
      break;
    case 'A5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/A5')).toList();
      break;
    case 'A#5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/Ash5')).toList();
      break;
    case 'B5':
      changingChords.value =
          chords.where((p0) => p0.contains('images/chords/B5')).toList();
      break;
    default:
  }
}
