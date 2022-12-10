import 'package:canwe/auth/display_profile.dart';
import 'package:canwe/auth/login.dart';
import 'package:canwe/donasi/donasi_page.dart';
import 'package:canwe/notifikasi/notif_page.dart';
import 'package:canwe/notifikasi/notifikasi_form_page.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final List<Widget> route = [
      Scaffold(),
      DonasiPage(),
      Scaffold(),
      NotifikasiFormPage(),      
      request.loggedIn ? DisplayProfilePage() : LoginPage(),
    ];
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.handshake_rounded),
          label: 'Donasi',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.create),
          label: 'Galang Dana',
          backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifikasi',
          backgroundColor: Color.fromARGB(255, 64, 128, 255),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
          backgroundColor: Colors.pink,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => route[value])));
      },
    );
  }
}
