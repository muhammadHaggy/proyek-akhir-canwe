import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:intl/intl.dart';
import 'package:canwe/widgets/bottom_navbar.dart';



class DetailDonasiPage extends StatefulWidget {
  DetailDonasiPage(
    {
      super.key,
      required this.id,
      required this.nama,
      required this.penggalang,
      required this.deskripsi,
      required this.target,
      required this.terkumpul,
      required this.urlFoto,
    }
  );

  final int id;
  final String nama;
  final String penggalang;
  final String deskripsi;
  final int target;
  int terkumpul;
  final String urlFoto;

  @override
  State<DetailDonasiPage> createState() => _DetailDonasiPageState();
}

class _DetailDonasiPageState extends State<DetailDonasiPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nominal = TextEditingController();
  // reference: https://stackoverflow.com/questions/14865568/currency-format-in-dart
  final oCcy = NumberFormat("#,##0.00", "IDR");


  bayarDonasi(request) async {
    final response = await request.post(
      'https://canwe.pythonanywhere.com/donasi/bayar/proses/${widget.id}',
      {
        "nominal": _nominal.text,
      }
    );
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://canwe.pythonanywhere.com${widget.urlFoto}"),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "Pembayaran Donasi",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.all(30.0),
          color: const Color(0x33ffffff),
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: const Color(0xe5f6fff7),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10.0
                    )
                  ]
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '< Donasi',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff048353),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Pembayaran',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff29452a),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 30),
                      child: Text(
                        widget.nama,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff426246),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        // color: blackSecondary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          // release date
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  'Penggalang: ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff516e58),
                                  ),
                                ),
                                Text(
                                  widget.penggalang,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff516e58),
                                  ),
                                ),
                              ]
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(top: 30),
                            child: Text(
                              widget.deskripsi,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xff505050),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 70),
                            child: Row(
                                children: [
                                  const Text(
                                    'Target: ',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff505050),
                                    ),
                                  ),
                                  Text(
                                    "Rp${oCcy.format(widget.target)}",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff505050),
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            child: Row(
                              children: [
                                const Text(
                                  'Donasi terkumpul: ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff505050),
                                  ),
                                ),
                                Text(
                                  "Rp${oCcy.format(widget.terkumpul)}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff505050),
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            child: Row(
                              children: const [
                                Text(
                                  'Masukkan nominal donasi kamu:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff505050),
                                  ),
                                ),
                              ]
                            ),
                          ),
                        ]
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: TextFormField(
                        controller: _nominal,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        // reference for formatter: https://www.flutterclutter.dev/flutter/tutorials/how-to-create-a-number-input/2021/86522/
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: "Nominal",
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onSaved: (String? value) {
                          setState(() {
                            _nominal.text = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xff048353)),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // bayarDonasi(request, widget.id, _nominal);
                            bayarDonasi(request).then((result) {
                              setState(() {
                                widget.terkumpul += int.parse(_nominal.text);
                                _nominal.clear();
                              });
                            });
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: ListView(
                                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                                    shrinkWrap: true,
                                    children: [
                                      const Center(
                                        child: Text(
                                            'Terima kasih, donasi Anda telah kami terima!'
                                        ),
                                      ),
                                      const SizedBox(height: 20),
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
                        child: const Text(
                          "Lakukan Donasi",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
        ),
        bottomNavigationBar: MyBottomNavBar(
          selectedIndex: 2,
        ),
      ),
    );
  }
}