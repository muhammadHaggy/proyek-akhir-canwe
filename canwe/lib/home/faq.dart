import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
    const BudgetPage({super.key});

    @override
    State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {

    // Daftar-daftar data yang disimpan
    static List<String> listNama = [];
    static List<String> listEmail = [];
    static List<String> listPertanyaan = [];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Display FAQ'),
            ),

            body:ListView.builder(
                // itemCount: listJudul.length,
                itemBuilder: (context, index) {
                    return Card(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                children:[

                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            listNama[index], style: const TextStyle(fontSize: 25),
                                            textAlign: TextAlign.left),
                                        ),
                                    ),

                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(listEmail[index], style: TextStyle(fontSize: 15),
                                                        textAlign: TextAlign.left),
                                                ),
                                            ),                                            
                                            Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text(listPertanyaan[index], style: TextStyle(fontSize: 15),
                                                        textAlign: TextAlign.right),
                                                ),
                                            ),
                                        ]
                                    ),
                                ],
                            )
                        ),
                    );
                },
                itemCount: listNama.length,
            ),
        );
    }
}

// memasukkan setiap data ke dalam array untuk ditampilkan
void inputDataBudget(String nama, String email, String pertanyaan){ 
    _BudgetPageState.listNama.add(nama);
    _BudgetPageState.listEmail.add(email);
    _BudgetPageState.listPertanyaan.add(pertanyaan);
}