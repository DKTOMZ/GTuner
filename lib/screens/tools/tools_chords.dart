import 'package:GTuner/control/home/tools/chords/chords_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GTuner/main.dart';

class ChordLibrary extends StatefulWidget {
  const ChordLibrary({Key? key}) : super(key: key);

  @override
  State<ChordLibrary> createState() => _ChordLibraryState();
}

late RxList<dynamic> changingChords;

class _ChordLibraryState extends State<ChordLibrary> {
  var chordName = 'C'.obs;
  var chordType = 'Maj'.obs;

  @override
  void initState() {
    super.initState();
    changingChords =
        chords.where((p0) => p0.contains('images/chords/CMajor')).toList().obs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chord Library'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Select a chord',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => DropdownButton(
                  value: chordName.value,
                  items: notes,
                  onChanged: (String? value) {
                    chordName.value = value.toString();
                    chordList(chordName.value, chordType.value);
                  },
                ),
              ),
              const SizedBox(width: 20),
              Obx(
                () => DropdownButton(
                  value: chordType.value,
                  items: chordTypes,
                  onChanged: (String? value) {
                    chordType.value = value.toString();
                    chordList(chordName.value, chordType.value);
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          showChords(changingChords),
          const SizedBox(
            height: 20,
          ),
          const Text('Swipe to see more shapes')
        ],
      ),
    );
  }
}
