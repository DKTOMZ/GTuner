import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:GTuner/control/auth/auth_control.dart';
import 'package:GTuner/screens/home/home_settings.dart';
import 'package:GTuner/screens/home/home_songs.dart';
import 'package:GTuner/screens/home/home_tools.dart';
import 'package:GTuner/screens/home/home_tune.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    //tuner.recordAudio();
  }

  final _authcontrol = Get.find<AuthController>();

  final Rx<int> _selectedIndex = 0.obs;

  final List<Widget> _pages = <Widget>[songs(), tune(), tools(), settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GTuner'),
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
          children: [
            _pages.elementAt(_selectedIndex.value),
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
