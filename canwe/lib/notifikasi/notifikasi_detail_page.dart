import 'package:flutter/material.dart';
import 'package:canwe/models/notifikasi.dart';
import 'package:intl/intl.dart';

class MyNotifikasitDetailPage extends StatelessWidget {
  final Notifikasi notif;

  const MyNotifikasitDetailPage({super.key, required this.notif});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Notifikasi'),
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
                      // ListTile(
                      //   leading: const Text(
                      //     'Deskripsi: ' ,
                      //     style: TextStyle(
                      //         fontSize: 16, fontWeight: FontWeight.bold),
                      //   ),
                      //   trailing: Text(
                      //     notif.fields.description,
                      //     style: const TextStyle(fontSize: 16),
                      //   ),
                      //   dense: true,
                      // ), 
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
                  Row(children: [
                    const SizedBox(height: 5),
                    TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(15.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () async{
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    ),),
                  ],)
                  
                  
                  // TextButton(
                  //   style: TextButton.styleFrom(
                  //       backgroundColor: Colors.red,
                  //       padding: const EdgeInsets.all(15.0),
                  //       alignment: Alignment.topLeft),
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: const Text(
                  //     "Delete",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}