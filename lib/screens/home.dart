import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:login_signup/control/auth/auth_control.dart';

import '../control/tuner/tuner.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final _tuner = Get.find<TunerController>();

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _tuner.recordAudio();
  }

  final _authcontrol = Get.find<AuthController>();

  // ignore: prefer_final_fields
  var _selectedIndex = 0.obs;

  final List<Widget> _pages = <Widget>[
    Icon(
      Icons.music_note,
      size: 150,
      color: Colors.amber.shade700,
    ),
    Column(
      children: [
        Obx(() => Text(
              _tuner.note.value,
              style: TextStyle(
                  color: Colors.amber.shade700,
                  fontSize: 90,
                  fontWeight: FontWeight.bold),
            )),
        Obx(() => Text(
              _tuner.status.value == 'undefined'
                  ? 'Play something'
                  : _tuner.status.value,
              style: TextStyle(
                  fontSize: 30,
                  color: _tuner.status.value == 'tuned' ||
                          _tuner.status.value == 'Play something'
                      ? Colors.green
                      : Colors.red),
            )),
        Obx(() => Text(
              _tuner.diff.value.toString(),
              style: const TextStyle(fontSize: 20),
            ))
      ],
    ),
    Icon(
      Icons.tune,
      size: 150,
      color: Colors.amber.shade700,
    ),
    Icon(
      Icons.settings,
      size: 150,
      color: Colors.amber.shade700,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert_outlined, color: Colors.white),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  child: Text('Logout'),
                  value: 0,
                )
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                _authcontrol.signOut();
              }
            },
          )
        ],
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: _pages.elementAt(_selectedIndex.value),
            )
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber.shade700,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.music_note, size: 40), label: 'Songs'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.guitar, size: 40), label: 'Tune'),
            BottomNavigationBarItem(
                icon: Icon(Icons.tune, size: 40), label: 'Tools'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 40), label: 'Settings'),
          ],
          currentIndex: _selectedIndex.value,
          onTap: (index) {
            _selectedIndex.value = index;
          },
        ),
      ),
    );
  }
}
