import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GTuner/screens/tools/tools_chords.dart';

Widget tools() => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tools',
            style: TextStyle(fontSize: 30, color: Colors.amber.shade700),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Metronome',
            style: TextStyle(fontSize: 22),
          ),
          Card(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: const AssetImage('images/tempo.jpg'),
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {},
                    ),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.dstATop),
                    height: 220,
                  ),
                  Icon(
                    CupertinoIcons.metronome,
                    size: 50,
                    color: Colors.amber.shade700,
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Chords',
            style: TextStyle(fontSize: 22),
          ),
          Card(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: const AssetImage('images/chords.jpg'),
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {
                        Get.to(const ChordLibrary());
                      },
                    ),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.dstATop),
                    height: 220,
                  ),
                  Icon(
                    Icons.tune,
                    size: 50,
                    color: Colors.amber.shade700,
                  )
                ],
              )),
        ],
      ),
    );
