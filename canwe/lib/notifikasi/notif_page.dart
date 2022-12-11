import 'package:canwe/utils/fetch_notifikasi.dart';
import 'package:flutter/material.dart';
import 'package:canwe/notifikasi/notifikasi_detail_page.dart';
import '../models/notifikasi.dart';
import 'package:canwe/main.dart';


class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Notifikasi'),
            ),
            body: FutureBuilder(
                    future: fetchNotifikasi(),
                    builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                            return const Center(child: CircularProgressIndicator());

                        } else {
                            if (!snapshot.hasData) {
                                return Column(
                                    children: const [
                                    Text("Tidak ada Notifikasi", style: TextStyle(color: Color(0xff59A5D8), fontSize: 20
                                ),
                                ),
                                SizedBox(height: 8),
                                ],
                            );
                            } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Material(
                                            elevation: 2.0,
                                            borderRadius: BorderRadius.circular(5.0),
                                            color: Colors.white,
                                            shadowColor: Colors.blueGrey,
                                            
                                            child: ListTile(
                                                onTap: () {
                                                // Route menu ke halaman details
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyNotifikasitDetailPage(notif: snapshot.data![index]),
                                                    ));
                                            },
                                                leading: Image(image: NetworkImage('https://i.imgur.com/dK4jT6U.png')),
                                                
                                                title  : RichText(
                                                    text: TextSpan(
                                                      // Note: Styles for TextSpans must be explicitly defined.
                                                      // Child text spans will inherit styles from parent
                                                      style: const TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.black,
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(text: snapshot.data![index].fields.title , style: const TextStyle(fontWeight: FontWeight.bold)),
                                                        TextSpan(text: ' mengirimkan pesan'),
                                                      ],  
                                                    ),
                                                  ),
                                                subtitle: Text(snapshot.data![index].fields.description),
                                            )
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

// class _NotifikasiPageState extends State<NotifikasiPage> {

//   late Future<List<Notifikasi>> futureData;

//   @override
//   void initState() {
//     super.initState();
//     futureData = fetchNotifikasi();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications'),
//       ),
//       body: FutureBuilder(
//           future: futureData,
//           builder: (context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return const Center(
//                   child: CircularProgressIndicator(
//                     // color: redPrimary,
//                   )
//               );
//             } else {
//               if (!snapshot.hasData) {
//                 return Column(
//                   children: const [
//                     Text(
//                       "Tidak ada Notifikasi :(",
//                       style: TextStyle(
//                           // color: whitePrimary,
//                           fontSize: 20),
//                     ),
//                     SizedBox(height: 8),
//                   ],
//                 );
//               } else {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (_, index)=> InkWell(
//                       onTap: () {
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => MyDetailPage(
//                         //           title: snapshot.data![index].fields.title,
//                         //           releaseDate: snapshot.data![index].fields.releaseDate,
//                         //           rating: snapshot.data![index].fields.rating,
//                         //           watched: snapshot.data![index].fields.watched,
//                         //           review: snapshot.data![index].fields.review,
//                         //         )
//                         //     )
//                         // );
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                         padding: const EdgeInsets.all(20.0),
//                         decoration: BoxDecoration(
//                           // color: blackSecondary,
//                           border: Border.all(
//                               // color: (snapshot.data![index].fields.watched == 'Already') ?
//                               // Colors.greenAccent : redPrimary,
//                               width: 3.0
//                           ),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Flexible(
//                                 child: Text(
//                                   "${snapshot.data![index].fields.title}",
//                                   style: const TextStyle(
//                                     fontSize: 20.0,
//                                     fontWeight: FontWeight.bold,
//                                     // color: whitePrimary,
//                                   ),
//                                 ),
//                               ),
//                               // Checkbox(value: (snapshot.data![index].fields.watched == 'Already'),
//                               //     activeColor: Colors.green,
//                               //     onChanged: (bool? value) {
//                               //       setState(() {
//                               //         snapshot.data![index].fields.watched = (value!) ? 'Already' : "Haven't";
//                               //       });
//                               //     }
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                 );
//               }
//             }
//           }
//       ),
//     );
//   }
// }