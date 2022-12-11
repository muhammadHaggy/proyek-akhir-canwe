import 'package:flutter/material.dart';
import 'package:canwe/home/faq.dart';

class FaqPage extends StatefulWidget {
    const FaqPage({super.key});

    @override
    State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
    final _formKey = GlobalKey<FormState>();

    String _nama = "";
    String _email = "";
    String _pertanyaan = "";
   
    bool isNumeric(String value){
      return int.tryParse(value) != null;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Kirim Pertanyaan'),
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
                                    child:
                                    TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Nama kamu",
                                            labelText: "Nama",
                                            // Menambahkan icon agar lebih intuitif
                                            icon: const Icon(Icons.person),
                                            // Menambahkan circular border agar lebih rapi
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        // Menambahkan behavior saat nama diketik 
                                        onChanged: (String? value) {
                                            setState(() {
                                                _nama = value!;
                                            });
                                        },
                                        // Menambahkan behavior saat data disimpan
                                        onSaved: (String? value) {
                                            setState(() {
                                                _nama = value!;
                                            });
                                        },
                                        // Validator sebagai validasi form
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Nama tidak boleh kosong!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    // Menggunakan padding sebesar 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                    TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "cacaca@gmail.com",
                                            labelText: "Email",
                                            // Menambahkan icon agar lebih intuitif
                                            icon: const Icon(Icons.email),
                                            // Menambahkan circular border agar lebih rapi
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        // Menambahkan behavior saat nama diketik 
                                        onChanged: (String? value) {
                                            setState(() {
                                                _email = value!;
                                            });
                                        },
                                        // Menambahkan behavior saat data disimpan
                                        onSaved: (String? value) {
                                            setState(() {
                                                _email = value!;
                                            });
                                        },
                                        // Validator sebagai validasi form
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Email tidak boleh kosong!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),                                
                                Padding(
                                    // Menggunakan padding sebesar 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                    TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Sampaikan pertanyaan kamu :)",
                                            labelText: "Pertanyaan",
                                            // Menambahkan icon agar lebih intuitif
                                            icon: const Icon(Icons.message),
                                            // Menambahkan circular border agar lebih rapi
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        // Menambahkan behavior saat nama diketik 
                                        onChanged: (String? value) {
                                            setState(() {
                                                _pertanyaan = value!;
                                            });
                                        },
                                        // Menambahkan behavior saat data disimpan
                                        onSaved: (String? value) {
                                            setState(() {
                                                _pertanyaan = value!;
                                            });
                                        },
                                        // Validator sebagai validasi form
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Pertanyaan harus diisi!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                            ], 
                        ),

                    ),

                ),

            ),
            floatingActionButton: Container( 
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(left: 30),
                child: TextButton(
                child: const Text(
                    "Kirim",
                    style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 88, 3)),
                ),
                onPressed: () {
                    if (_formKey.currentState!.validate()) {
                        inputDataBudget(_nama, _email, _pertanyaan);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FaqPage()),
                        );
                    }
                },
            ),
            ),
        );
    }
}