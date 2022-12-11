// import 'package:flutter/material.dart';
//
// class MyDetailPage extends StatefulWidget {
//   const MyDetailPage({
//     super.key,
//     required this.title,
//     required this.releaseDate,
//     required this.rating,
//     required this.watched,
//     required this.review,
//   }
//       );
//
//   final String title;
//   final String releaseDate;
//   final String rating;
//   final String watched;
//   final String review;
//
//   @override
//   State<MyDetailPage> createState() => _MyDetailPageState();
// }
//
// class _MyDetailPageState extends State<MyDetailPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('My Watch List'),
//         ),
//         // Menambahkan drawer menu
//         backgroundColor: blackPrimary,
//         body: Container(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(top: 40, bottom: 40, left: 10, right: 10),
//                 child: Text(
//                   widget.title.toUpperCase(),
//                   style: const TextStyle(
//                     fontSize: 60,
//                     fontWeight: FontWeight.bold,
//                     color: redPrimary,
//                   ),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 padding: const EdgeInsets.all(20.0),
//                 decoration: BoxDecoration(
//                   color: blackSecondary,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Column(
//                     children: [
//                       // release date
//                       Container(
//                         margin: const EdgeInsets.only(bottom: 10),
//                         child: Row(
//                             children: [
//                               const Text(
//                                 'Release Date: ',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: redPrimary,
//                                 ),
//                               ),
//                               Text(
//                                 widget.releaseDate,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white.withOpacity(0.87),
//                                 ),
//                               ),
//                             ]
//                         ),
//                       ),
//                       // rating
//                       Container(
//                         margin: const EdgeInsets.only(bottom: 10),
//                         child: Row(
//                             children: [
//                               const Text(
//                                 'Rating: ',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: redPrimary,
//                                 ),
//                               ),
//                               Text(
//                                 '${widget.rating}/5',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white.withOpacity(0.87),
//                                 ),
//                               ),
//                             ]
//                         ),
//                       ),
//                       // watched
//                       Container(
//                         margin: const EdgeInsets.only(bottom: 10),
//                         child: Row(
//                             children: [
//                               const Text(
//                                 'Watched: ',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: redPrimary,
//                                 ),
//                               ),
//                               Text(
//                                 widget.watched,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: (widget.watched == 'Already') ?
//                                   Colors.greenAccent : redPrimary,
//                                 ),
//                               ),
//                             ]
//                         ),
//                       ),
//                       // review
//                       Container(
//                         margin: const EdgeInsets.only(bottom: 10),
//                         child: Row(
//                             children: const [
//                               Text(
//                                 'Review:',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: redPrimary,
//                                 ),
//                               ),
//                             ]
//                         ),
//                       ),
//                       // review text
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           widget.review,
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white.withOpacity(0.87),
//                           ),
//                         ),
//                       )
//                     ]
//                 ),
//               ),
//               Expanded(
//                 child: Align(
//                     alignment: FractionalOffset.bottomCenter,
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: TextButton(
//                         style: TextButton.styleFrom(
//                           padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
//                           backgroundColor: redPrimary,
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text(
//                           'Back',
//                           style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white
//                           ),
//                         ),
//                       ),
//                     )
//                 ),
//               )
//             ],
//           ),
//         )
//     );
//   }
// }