import 'package:flutter/material.dart';
// import 'package:canwe/page/detail.dart';
// import 'package:canwe/components/drawer.dart';
import 'package:canwe/models/donasi.dart';
import 'package:canwe/main.dart';
import 'package:canwe/utils/get_data_donasi.dart';

class DonasiPage extends StatefulWidget {
  const DonasiPage({super.key});

  @override
  State<DonasiPage> createState() => _DonasiPageState();
}

class _DonasiPageState extends State<DonasiPage> {

  late Future<List<Datum>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchDonasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donasi'),
      ),
      // Menambahkan drawer menu
      // drawer: const DrawerTugas(),
      body: FutureBuilder(
        future: futureData,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
                child: CircularProgressIndicator(
                  // color: redPrimary,
                )
            );
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Sayang sekali, saat ini sedang tidak ada penggalangan dana yang dilakukan :(",
                    style: TextStyle(
                        // color: whitePrimary,
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
                            builder: (context) => const DonasiPage(
                            )
                        )
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      // color: blackSecondary,
                      border: Border.all(
                          // color: (snapshot.data![index].fields.watched == 'Already') ?
                          // Colors.greenAccent : redPrimary,
                          width: 3.0
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${snapshot.data![index].fields.nama}",
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              // color: whitePrimary,
                            ),
                          ),
                          Text(
                            "Digalang oleh ${snapshot.data![index].fields.penggalang}",
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              // color: whitePrimary,
                            ),
                          ),
                          Text(
                            "Target: ${snapshot.data![index].fields.target}",
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              // color: whitePrimary,
                            ),
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