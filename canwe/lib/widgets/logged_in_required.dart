import 'package:canwe/auth/login.dart';
import 'package:canwe/widgets/botton_navbar.dart';
import 'package:flutter/material.dart';

class LoggedInRequired extends StatelessWidget {
  const LoggedInRequired({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(64, 105, 225, 1),
            ),
          ),
          TextButton(
            onPressed: (() => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => LoginPage())))),
            child: Text("Login Sekarang"),
          ),
        ],
      ),
    );
  }
}
