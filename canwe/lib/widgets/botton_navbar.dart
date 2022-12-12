import 'package:canwe/auth/display_profile.dart';
import 'package:canwe/auth/login.dart';
import 'package:canwe/donasi/donasi_page.dart';
import 'package:canwe/home/home_page.dart';
import 'package:canwe/notifikasi/notif_admin_page.dart';
import 'package:canwe/notifikasi/notif_page.dart';
import 'package:canwe/auth/moderasi_galang_dana.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({super.key, required this.selectedIndex});
  final int selectedIndex;
  int _bottomNavCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final List<Widget> route = request.loggedIn
        ? [
            HomePage(),
            request.jsonData["is_admin"] ? ModerasiGalangDana() : DonasiPage(),
            Scaffold(),
            request.jsonData["is_admin"]
                ? NotifikasiAdminPage()
                : NotifikasiPage(),
            DisplayProfilePage(),
          ]
        : [
            HomePage(),
            LoginPage(),
            LoginPage(),
            LoginPage(),
            LoginPage(),
          ];

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.home,
            color: Colors.white,
          ),
          icon: new Icon(
            Icons.home,
            color: Colors.white12,
          ),
          label: 'Home',
          backgroundColor: Color.fromARGB(248, 32, 105, 3),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.handshake,
            color: Colors.white,
          ),
          icon: new Icon(
            Icons.handshake,
            color: Colors.white12,
          ),
          label: 'Donasi',
          backgroundColor: Color.fromARGB(248, 32, 105, 3),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.create,
            color: Colors.white,
          ),
          icon: new Icon(
            Icons.create,
            color: Colors.white12,
          ),
          label: 'Galang Dana',
          backgroundColor: Color.fromARGB(248, 32, 105, 3),
        ),
         BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          icon: new Icon(
            Icons.notifications,
            color: Colors.white12,
          ),
          label: 'Notifikasi',
          backgroundColor: Color.fromARGB(248, 32, 105, 3),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.person,
            color: Colors.white,
          ),
          icon: new Icon(
            Icons.person,
            color: Colors.white12,
          ),
          label: 'Profil',
          backgroundColor: Color.fromARGB(248, 32, 105, 3),
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      onTap: (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => route[value])));
      },
    );
  }
}
