import 'package:canwe/auth/display_profile.dart';
import 'package:canwe/auth/login.dart';
import 'package:canwe/auth/moderasi_galang_dana.dart';
import 'package:canwe/donasi/donasi_page.dart';
import 'package:canwe/notifikasi/notif_page.dart';
import 'package:canwe/notifikasi/notifikasi_form_page.dart';
import 'package:canwe/notifikasi/notif_admin_page.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final List<Widget> route = request.loggedIn
        ? [
            Scaffold(),
            request.jsonData["is_admin"] ? ModerasiGalangDana() : DonasiPage(),
            Scaffold(),
            request.jsonData["is_admin"]
                ? NotifikasiAdminPage()
                : NotifikasiPage(),
            DisplayProfilePage(),
          ]
        : [
            Scaffold(),
            LoginPage(),
            LoginPage(),
            LoginPage(),
            LoginPage(),
          ];
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: request.loggedIn && request.jsonData["is_admin"]
              ? Icon(Icons.admin_panel_settings)
              : Icon(Icons.handshake_rounded),
          label: request.loggedIn && request.jsonData["is_admin"]
              ? "Moderasi"
              : 'Donasi',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.create),
          label: 'Galang Dana',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifikasi',
          backgroundColor: Color.fromARGB(255, 64, 128, 255),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
          backgroundColor: Colors.green,
        ),
      ],
      currentIndex: selectedIndex,
      unselectedItemColor: Colors.grey[350],
      selectedItemColor: Colors.white,
      onTap: (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => route[value])));
      },
    );
  }
}
