import 'package:flutter/material.dart';
// import 'package:canwe/page/detail.dart';
// import 'package:canwe/components/drawer.dart';
// import 'package:canwe/model/watch_list.dart';
import 'package:canwe/main.dart';
// import 'package:canwe/utils/get_my_watch_list.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {

  late Future<List<WatchList>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
        backgroundColor: redPrimary,
      ),
      // Menambahkan drawer menu
      drawer: const DrawerTugas(),
      backgroundColor: blackPrimary,
      body: FutureBuilder(
          future: futureData,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: redPrimary,
                  )
              );
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada Watch List :(",
                      style: TextStyle(
                          color: whitePrimary,
                          fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyDetailPage(
                                  title: snapshot.data![index].fields.title,
                                  releaseDate: snapshot.data![index].fields.releaseDate,
                                  rating: snapshot.data![index].fields.rating,
                                  watched: snapshot.data![index].fields.watched,
                                  review: snapshot.data![index].fields.review,
                                )
                            )
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: blackSecondary,
                          border: Border.all(
                              color: (snapshot.data![index].fields.watched == 'Already') ?
                              Colors.greenAccent : redPrimary,
                              width: 3.0
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: whitePrimary,
                                  ),
                                ),
                              ),
                              Checkbox(value: (snapshot.data![index].fields.watched == 'Already'),
                                  activeColor: Colors.green,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      snapshot.data![index].fields.watched = (value!) ? 'Already' : "Haven't";
                                    });
                                  }
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                );
              }
            }
          }
      ),
    );
  }
}