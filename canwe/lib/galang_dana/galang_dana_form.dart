import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class GalangDanaFormPage extends StatefulWidget {
  const GalangDanaFormPage({super.key});

  @override
  State<GalangDanaFormPage> createState() => _GalangDanaFormPageState();
}

class _GalangDanaFormPageState extends State<GalangDanaFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _deskripsi = "";
  int _targetDana = 0;
  String? _tipe;
  XFile? _foto;
  final ImagePicker _picker = ImagePicker();
  final String uploadUrl = 'https://canwe.pythonanywhere.com/media/';
  List<String> listTipeGalangDana = ['Makanan', 'Penyuluhan Pendidikan Gizi'];

  void _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _foto = pickedFile;
      });
    } catch (e) {
      print("Image picker error $e");
    }
  }

  // Future<String?> uploadImage(filepath, url) async {
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.files.add(await http.MultipartFile.fromPath('image', filepath));
  //   var res = await request.send();
  //   return res.reasonPhrase;
  // }

  void _createGalangDana(dynamic request, String tipe, String judul,
      String deskripsi, int target, XFile foto) async {
    try {
      await request.post('https://canwe.pythonanywhere.com/galang-dana/add/', {
        'tipe': tipe,
        'judul': judul,
        'deskripsi': deskripsi,
        'target': target.toString(),
        'foto': base64.encode(await foto.readAsBytes())
      });
    } catch (e) {
      print('error jir: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Galang Dana'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Judul',
                        hintText:
                            'contoh: Bantu Pangan Korban Letusan Gunung Semeru',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Harap isi judul galang dana Anda';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Deskripsi',
                        hintText:
                            'kamu bisa ceritakan apa yang membuat kamu ingin membuka galang dana ini',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    maxLines: 3,
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Harap isi deskripsi galang dana Anda';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Dana yang Dibutuhkan',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        _targetDana = int.parse(value!);
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _targetDana = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Harap isi dana yang dibutuhkan dari galang dana Anda';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Tipe Galang Dana:'),
                  trailing: DropdownButton(
                    value: _tipe,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listTipeGalangDana.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _tipe = newValue!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Foto:'),
                  trailing: TextButton(
                    onPressed: (() => _pickImage()),
                    child: const Text('Pilih foto'),
                  ),
                ),
                if (_foto != null)
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      _foto!.name,
                    ),
                  ),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: const Text(
                    'Kirim',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _createGalangDana(request, _tipe!, _judul, _deskripsi,
                          _targetDana, _foto!);

                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 15,
                            child: ListView(
                              padding: const EdgeInsets.all(20),
                              shrinkWrap: true,
                              children: <Widget>[
                                const Center(
                                  child: Text(
                                    'Berhasil',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text('Galang Dana berhasil dibuat!'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Kembali'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
