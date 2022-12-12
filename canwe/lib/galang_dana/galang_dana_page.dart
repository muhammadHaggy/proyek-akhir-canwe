import 'package:canwe/galang_dana/galang_dana_form.dart';
import 'package:canwe/utils/get_user_count.dart';
import 'package:flutter/material.dart';

class GalangDanaPage extends StatefulWidget {
  const GalangDanaPage({super.key});

  @override
  State<GalangDanaPage> createState() => _GalangDanaPageState();
}

class _GalangDanaPageState extends State<GalangDanaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galang Dana'),
      ),
      body: FutureBuilder(
        future: fetchUserDetail(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                          'Ada ${snapshot.data!.length} donatur yang siap membantu Anda!',
                          style: const TextStyle(fontSize: 24))),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(height: 1),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(15))
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GalangDanaFormPage(),
                            ));
                      },
                      child: const Text(
                        'Buat Galang Dana',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
