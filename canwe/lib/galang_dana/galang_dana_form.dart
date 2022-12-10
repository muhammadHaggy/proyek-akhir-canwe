import 'package:flutter/material.dart';

class GalangDanaFormPage extends StatefulWidget {
  const GalangDanaFormPage({super.key});

  @override
  State<GalangDanaFormPage> createState() => _GalangDanaFormPageState();
}

class _GalangDanaFormPageState extends State<GalangDanaFormPage> {
  final _formKey = GlobalKey<FormState>();
  String tipe = "";
  String judul = "";
  String deskripsi = "";
  int targetDana = 0;
  // Foto = ???
  List<String> listTipeGalangDana = ['Makanan', 'Penyuluhan Pendidikan Gizi'];

  void _createGalangDana() {
    // submit form galang dana ke web
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: bikin form galang dana
    );
  }
}