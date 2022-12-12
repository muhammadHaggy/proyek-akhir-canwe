import 'package:flutter/material.dart';
import 'package:canwe/donasi/detail_donasi.dart';
import 'package:canwe/models/donasi.dart';
import 'package:canwe/utils/get_data_donasi.dart';
import 'package:canwe/widgets/botton_navbar.dart';
import 'package:intl/intl.dart';


class DonasiPage extends StatefulWidget {
  const DonasiPage({super.key});

  @override
  State<DonasiPage> createState() => _DonasiPageState();
}

class _DonasiPageState extends State<DonasiPage> {

  late Future<List<Datum>> futureData;
  final oCcy = NumberFormat("#,##0.00", "IDR");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Donasi",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: fetchDonasi(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff048353),
              )
            );
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Sayang sekali, saat ini sedang tidak ada penggalangan dana yang dilakukan :(",
                    style: TextStyle(
                        color: Color(0xff505050),
                        fontSize: 18),
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
                        builder: (context) => DetailDonasiPage(
                          id: snapshot.data![index].pk,
                          nama: snapshot.data![index].fields.nama,
                          penggalang: snapshot.data![index].fields.penggalang,
                          deskripsi: snapshot.data![index].fields.deskripsi,
                          target: snapshot.data![index].fields.target,
                          terkumpul: snapshot.data![index].fields.terkumpul,
                          urlFoto: snapshot.data![index].fields.urlFoto,
                        )
                      )
                    ).then((_) => setState(() {}));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    // padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5,
                        )
                      ]
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network("https://canwe.pythonanywhere.com${snapshot.data![index].fields.urlFoto}"),
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "${snapshot.data![index].fields.nama}",
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Digalang oleh: ${snapshot.data![index].fields.penggalang}",
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(top: 100),
                                  child: Text(
                                    "Target: Rp${oCcy.format(snapshot.data![index].fields.target)}",
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Terkumpul: Rp${oCcy.format(snapshot.data![index].fields.terkumpul)}",
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                ),
                              ]
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
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: 2,
      ),
    );
  }
}