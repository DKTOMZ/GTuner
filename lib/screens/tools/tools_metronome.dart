import 'package:GTuner/control/home/tools/metronome/metronome.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class MetroUI extends StatefulWidget {
  const MetroUI({Key? key}) : super(key: key);

  @override
  State<MetroUI> createState() => _MetroUIState();
}

int beats = 4;
double bpm = 30.0;
int timeInterval = (60000 ~/ bpm.round());
bool play = false;

class _MetroUIState extends State<MetroUI> {
  double iconSize = 40;
  var elapse = Duration.zero;
  List<DropdownMenuItem<int>> times = const [
    DropdownMenuItem(
      child: Text('1/4'),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text('2/4'),
      value: 2,
    ),
    DropdownMenuItem(
      child: Text('3/4'),
      value: 3,
    ),
    DropdownMenuItem(
      child: Text('4/4'),
      value: 4,
    ),
    DropdownMenuItem(
      child: Text('5/8'),
      value: 5,
    ),
    DropdownMenuItem(
      child: Text('6/8'),
      value: 6,
    ),
    DropdownMenuItem(
      child: Text('7/8'),
      value: 7,
    ),
    DropdownMenuItem(
      child: Text('9/8'),
      value: 9,
    ),
    DropdownMenuItem(
      child: Text('12/8'),
      value: 12,
    ),
  ];
  final metro = Get.find<MetronomeController>();

  @override
  void dispose() {
    if (play) {
      metro.stop();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Metronome')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          bpm.round().toString() + ' BPM',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                iconSize: iconSize,
                onPressed: () {
                  setState(() {
                    if (bpm > 30.0) {
                      bpm -= 1;
                    }
                  });
                },
                icon: const Icon(Icons.remove),
                color: Colors.amber.shade700),
            Slider(
                value: bpm,
                onChanged: (value) {
                  setState(() {
                    bpm = value;
                  });
                },
                max: 240.0,
                min: 30.0,
                activeColor: Colors.amber.shade700),
            IconButton(
                iconSize: iconSize,
                onPressed: () {
                  setState(() {
                    if (bpm < 240.0) {
                      setState(() {
                        bpm += 1;
                      });
                    }
                  });
                },
                icon: const Icon(Icons.add),
                color: Colors.amber.shade700),
          ],
        ),
        const SizedBox(height: 60),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Widget>.generate(
                beats,
                (i) => Obx(
                      () => Container(
                          height: 20,
                          width: 20,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: i == (metro.count.value) - 1 && play
                                  ? Colors.amber.shade700
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(50))),
                    ))),
        const SizedBox(
          height: 50,
        ),
        const Text('Time signature'),
        DropdownButton(
            value: beats,
            items: times,
            onChanged: (int? value) {
              setState(() {
                beats = value!;
              });
            }),
        const SizedBox(
          height: 40,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            iconSize: iconSize,
            onPressed: () {
              setState(() {
                play = !play;
              });
            },
            icon: play == false
                ? const Icon(Icons.play_arrow)
                : const Icon(Icons.pause),
            color: Colors.amber.shade700,
          ),
        ]),
        play == false
            ? const Text(
                'Tap to play',
                style: TextStyle(color: Colors.green),
              )
            : const Text(
                'Tap to pause',
                style: TextStyle(color: Colors.red),
              ),
      ]),
    );
  }
}
