import 'package:canwe/main.dart';
import 'package:flutter/services.dart';
import 'package:canwe/notifikasi/notif_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotifikasiFormPage extends StatefulWidget {
  const NotifikasiFormPage({super.key});

  @override
  State<NotifikasiFormPage> createState() => _SendNotificationPageState();
}

class Notifikasi {
  // late int user;
  late String title;
  late String description;

  Notifikasi(
      { required this.title, required this.description});
}

class _SendNotificationPageState extends State<NotifikasiFormPage> {
  final _formKey = GlobalKey<FormState>();
  // int? user;
  String? _title;
  String? description;

  Future<void> onPressed(BuildContext context) async{
        final response = await http.post(
            Uri.parse('https://canwe.pythonanywhere.com/notifikasi/create_notif_flutter/'),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode(<String, dynamic>{
                'title': _title,
                'description': description,
                
            })
        );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NotifikasiPage()),
            );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Notifikasi'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Pendidikan",
                      labelText: "Kategori",
                       // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.category),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Pengirim tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Kategori ini adalah kategori terbaik",
                      labelText: "Deskripsi",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.description),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (value != '') {
                          description = value!;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        if (value != '') {
                          description = value!;
                        }
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(16.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                          onPressed(context);
                      }
                    },
                    child: const Text( "Simpan Kategori", style: TextStyle(color: Colors.white )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}