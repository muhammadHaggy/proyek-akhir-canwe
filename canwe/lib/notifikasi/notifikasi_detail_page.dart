import 'package:flutter/material.dart';
import 'package:canwe/models/notifikasi.dart';
import 'package:intl/intl.dart';
import 'package:canwe/widgets/botton_navbar.dart';


class MyNotifikasitDetailPage extends StatelessWidget {
  final Notifikasi notif;

  const MyNotifikasitDetailPage({super.key, required this.notif});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Notifikasi'),
        backgroundColor: Colors.green,
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
            
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        "Pengirim: " + notif.fields.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: notif.fields.description, style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 83, 83, 83),
                                )),
                            ],  
                          ),
                        )      
                    ],
                  ),
                  const Spacer(flex: 5),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(
                      key: GlobalKey(debugLabel: "BottomNavBar"),
                      selectedIndex: 3,
            ),
    );
  }
}