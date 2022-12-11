import 'package:canwe/utils/get_data_faq.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class ShowQuestPage extends StatefulWidget {
  const ShowQuestPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowQuestPageState createState() => _ShowQuestPageState();
}

class _ShowQuestPageState extends State<ShowQuestPage> {
  Future dataWatchlist = fetchFAQ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Pertanyaan'),
        ),

        body: FutureBuilder(
            future: dataWatchlist,
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
                } else {
                if (!snapshot.hasData) {
                    return Column(
                    children: const [
                        Text(
                        "Tidak ada pertanyaan :(",
                        style: TextStyle(
                            color: Color.fromARGB(248, 32, 105, 3),
                            fontSize: 20),
                        ),
                        SizedBox(height: 8),
                    ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index)=> GestureDetector(
                        // onTap: () {
                        // // Route menu ke halaman form
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => DetailPage(film: snapshot.data![index])),
                        // );
                        // },
                        child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(248, 32, 105, 3),
                            
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 1.0
                            )
                            ]
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [ Text(
                                  "${snapshot.data![index].fields.question}",
                                  style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white
                                  ),
                                ),

                                Expanded(child: Container()),
                                
                                ]
                              ),
                            ],
                        ),
                        )
                      )
                    );
                }
                }
            }
        )
    );
  }
}