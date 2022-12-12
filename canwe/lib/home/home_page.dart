import 'package:canwe/donasi/donasi_page.dart';
import 'package:canwe/home/faq.dart';
import 'package:canwe/home/faq_page.dart';
import 'package:canwe/home/showquest_page.dart';
import 'package:canwe/utils/get_data_faq.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://cdn.pixabay.com/photo/2017/02/03/17/41/poverty-2035694_960_720.jpg"),
                        fit: BoxFit.cover )),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.black.withOpacity(0.0),
                          Colors.black.withOpacity(0.0),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(1.0),
                        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                    ),
                  ),

                  Positioned(
                    bottom: 90,
                    left: 20,
                    child: RichText(
                    text: TextSpan(
                      text: "Selamat datang di",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 20
                      ),
                      children: [
                        TextSpan(
                          text: "\nCanWe!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 24))
                      ]),
                    )
                  ),
                ],
              ),

              Stack(
                children: [
                  Container(
                    height: height * 0.4,
                    width: width,
                  ),

                  Positioned(
                    top: 50,
                    bottom: 50,
                    left: 20,
                    right: 20,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Menurut Global Hunger Index (GHI), tingkat kelaparan \nIndonesia menempati urutan ketiga tertinggi \ndi Asia Tenggara pada 2021. Indonesia mendapatkan \nskor indeks sebesar 18 poin atau termasuk ke dalam level \nmoderat. GHI menggambarkan situasi kelaparan suatu negara \nyang berhubungan dengan kebutuhan dasar \nfisiologis manusia, yaitu kebutuhan pangan dan nutrisi. \nSkor indeks GHI didasarkan pada empat komponen, \nyaitu kondisi kurang gizi, anak yang kurus, \nstunting anak, dan kematian anak.",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        )),
                    )
                  ),
                ],
              ),

              // Stack(
              //   children: [
              //     Container(
              //       height: height * 0.05,
              //       width: width,
              //     ),

              //     Positioned(
              //       top: 0,
              //       bottom: 0,
              //       left: 20,
              //       right: 20,
              //       child: RichText(
              //         textAlign: TextAlign.center,
              //         text: TextSpan(
              //           text: "Layanan Kami",
              //           style: TextStyle(
              //             color: Colors.black87,
              //             fontWeight: FontWeight.w500,
              //             fontSize: 16,
              //           )),
              //       ),
              //     ),
              //   ],
              // ),

              Stack(
                children: [
                  Container(
                    height: height * 0.8,
                    width: width,
                    color: Color.fromARGB(248, 5, 17, 0),
                  ),

                  Positioned(
                    left: 20,
                    right: 20,
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Image.network("https://images.unsplash.com/photo-1437914983566-976d85602771?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Donasi',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              textAlign: TextAlign.center,
                              'Dengan melakukan donasi, kamu turut berpartisipasi dalam meningkatkan kualitas hidup anak-anak dan keluarga yang membutuhkan.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 100,
          
                              child: TextButton(
                                child: const Text(
                                  "Lihat", style: TextStyle(color: Colors.white)),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(248, 32, 105, 3))),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const DonasiPage()),
                                  );
                                }
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Stack(
                children: [
                  Container(
                    height: height * 0.02,
                    width: width,
                  ),
                ],
              ),

              Stack(
                children: [
                  Container(
                    height: height * 0.8,
                    width: width,
                    color: Color.fromARGB(248, 5, 17, 0)
                  ),

                  Positioned(
                    left: 20,
                    right: 20,
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Image.network("https://images.unsplash.com/photo-1532629345422-7515f3d16bb6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Galang Dana',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              textAlign: TextAlign.center,
                              'Dengan membuat penggalangan dana, kamu akan menjadi perantara untuk meningkatkan kualitas hidup anak-anak dan keluarga yang membutuhkan.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 100,
          
                              child: TextButton(
                                child: const Text(
                                  "Lihat", style: TextStyle(color: Colors.white)),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(248, 32, 105, 3))),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const FaqPage()),
                                  );
                                }
                              ),

                              
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Stack(
                children: [
                  Container(
                    height: height * 0.4,
                    width: width,
                  ),

                  Positioned(
                    top: 50,
                    bottom: 50,
                    left: 20,
                    right: 20,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "CanWe hadir untuk membantu menanggulangi permasalahan \nyang dihadapi masyarakat Indonesia dalam memenuhi kebutuhan \npangan dan nutrisi. CanWe merupakan situs yang bertujuan \nuntuk mengumpulkan donasi dan penggalangan dana \nagar dapat meningkatkan kualitas hidup anak-anak \ndan keluarga yang membutuhkan dengan menyediakan \nmakanan sehat dan pendidikan gizi. Melalui CanWe, \nkami berharap dapat memastikan bahwa lebih banyak anak \nyang tidak hanya dapat bertahan, melainkan berkembang, \nhari ini, dan seterusnya.",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        )),
                    )
                  ),
                ],
              ),

              Stack(
                children: [
                  Container(
                    height: height * 0.1,
                    width: width,
                  ),

                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Kamu memiliki pertanyaan? \nJangan ragu untuk menghubungi pihak CanWe :)",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                    ),
                  ),
                ],
              ),

              Stack(
                children: [
                  Container(
                    height: height * 0.05,
                    width: width,
                  ),

                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: TextButton(
                      child: const Text(
                        "Kirim Pertanyaan", style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(248, 32, 105, 3))),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const FaqPage()),
                        );
                      }
                    ),
                  ),
                ],
              ),

              Stack(
                children: [
                  Container(
                    height: height * 0.1,
                    width: width,
                  ),

                  Positioned(
                    top: 30,
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Sebelum itu, yuk lihat dulu pertanyaan yang sudah kami terima!",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        )),
                    ),
                  ),
                ],
              ),

              Stack(
                children: [
                  Container(
                    height: height * 0.05,
                    width: width,
                  ),

                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: TextButton(
                      child: const Text(
                        "Klik di sini", style: TextStyle(color: Colors.black54)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const ShowQuestPage()),
                        );
                      }
                    ),
                  ),
                ],
              ),

              // Stack(
              //   children: [
              //     Container(
              //       height: height * 0.05,
              //       width: width,
              //     ),

              //     Positioned(
              //       top: 0,
              //       bottom: 0,
              //       left: 20,
              //       right: 20,
              //       child: TextButton(
              //         child: const Text(
              //           "cekk", style: TextStyle(color: Colors.black54)),
              //         style: ButtonStyle(
              //           backgroundColor: MaterialStateProperty.all(Colors.white)),
              //         onPressed: () {
              //           Navigator.pushReplacement(
              //             context,
              //             MaterialPageRoute(builder: (context) => const BudgetPage()),
              //           );
              //         }
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

}