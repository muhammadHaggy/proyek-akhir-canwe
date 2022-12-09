import 'package:canwe/auth/login.dart';
import 'package:canwe/auth/profile.dart';
import 'package:canwe/widgets/botton_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../models/profile.dart';

class DisplayProfilePage extends StatefulWidget {
  const DisplayProfilePage({super.key});

  @override
  State<DisplayProfilePage> createState() => _DisplayProfilePageState();
}

class _DisplayProfilePageState extends State<DisplayProfilePage> {
  final selectedNavbarIndex = 3;
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final columnHeight = 40.0;

    Future<Profile> getProfileInfo() async {
      final response = await request
          .get("https://canwe.pythonanywhere.com/user/profile/json");
      return Profile.fromJson(response);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.grey[700],
                  size: 30,
                )),
          ),
        ],
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getProfileInfo(),
        builder: (context, AsyncSnapshot<Profile> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var profile = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: LayoutBuilder(
                builder: (p0, p1) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: p1.maxHeight),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      'Profile',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(64, 105, 225, 1),
                                      ),
                                    ),
                                  ),
                                ),
                                Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(2),
                                    1: FlexColumnWidth(3),
                                  },
                                  children: [
                                    TableRow(children: [
                                      SizedBox(
                                        height: columnHeight,
                                        child: Text(
                                          'Username:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(profile.username),
                                    ]),
                                    TableRow(children: [
                                      SizedBox(
                                        height: columnHeight,
                                        child: Text(
                                          'First Name:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(profile.firstName),
                                    ]),
                                    TableRow(children: [
                                      SizedBox(
                                        height: columnHeight,
                                        child: Text(
                                          "Last Name:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(profile.lastName),
                                    ]),
                                    TableRow(children: [
                                      SizedBox(
                                        height: columnHeight,
                                        child: Text(
                                          "Email Address:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(profile.email),
                                    ]),
                                    TableRow(children: [
                                      SizedBox(
                                        height: columnHeight,
                                        child: Text(
                                          "Tanggal Lahir:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(profile.tanggalLahir
                                          .toString()
                                          .substring(0, 10)),
                                    ]),
                                    TableRow(children: [
                                      SizedBox(
                                        height: columnHeight,
                                        child: Text(
                                          "Bio Singkat:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(profile.bioSingkat),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                if (!mounted) return;
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const ProfilePage()));
                              },
                              child: Container(
                                width: 200,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 224, 227, 231),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 19),
                                    ),
                                    SizedBox(width: 15),
                                    Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 26,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      bottomNavigationBar: MyBottomNavBar(
        key: GlobalKey(debugLabel: "BottomNavBar"),
        selectedIndex: selectedNavbarIndex,
      ),
    );
  }
}
