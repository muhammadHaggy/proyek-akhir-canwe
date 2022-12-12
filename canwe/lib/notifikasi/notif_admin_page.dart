import 'package:canwe/notifikasi/notifikasi_form_page.dart';
import 'package:canwe/notifikasi/notif_page.dart';
import 'package:canwe/utils/fetch_notifikasi.dart';
import 'package:flutter/material.dart';
import 'package:canwe/notifikasi/notifikasi_detail_page.dart';
import '../models/notifikasi.dart';
import 'package:canwe/widgets/botton_navbar.dart';


class NotifikasiAdminPage extends StatefulWidget {
  const NotifikasiAdminPage({super.key});

  @override
  State<NotifikasiAdminPage> createState() => _NotifikasiAdminPageState();
}

class _NotifikasiAdminPageState extends State<NotifikasiAdminPage> {
    late Future<List<Notifikasi>> _notifikasi;
    
    @override
    void initState(){
      super.initState();
      _notifikasi = fetchNotifikasi();
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: const Text('Notifikasi'),
            backgroundColor: Colors.green,
            ),
            body: FutureBuilder(
                    future: _notifikasi,
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
                                                leading: GestureDetector(
                                                    behavior: HitTestBehavior.translucent,
                                                    onTap: () {},
                                                    child: Container(
                                                      width: 48,
                                                      height: 48,
                                                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                                                      alignment: Alignment.center,
                                                      child: CircleAvatar(
                                                        child: Text("W",
                                                        style: const TextStyle(fontWeight: FontWeight.bold)),                             
                                                        backgroundColor: Color.fromARGB(255, 191, 118, 204),
                                                        foregroundColor: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  title  : RichText(
                                                    text: TextSpan(
                                                      // Note: Styles for TextSpans must be explicitly defined.
                                                      // Child text spans will inherit styles from parent
                                                      style: const TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.black,
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: snapshot.data![index].fields.title , style: const TextStyle(fontWeight: FontWeight.bold)),
                                                        TextSpan(text: ' mengirimkan pesan'),
                                                      ],  
                                                    ),
                                                  ),
                                                  dense: false,
                                                        
                                                  trailing: IconButton(
                                                  onPressed: () async{
                                                    // setState(() async*{
                                                    //   // var pk = snapshot.data![index].pk;
                                                    //   // final response = await request.post("https://canwe.pythonanywhere.com/notifikasi/delete/$pk/", {});
                                                    //   _notifikasi = deleteAlbum(snapshot.data![index].pk.toString());

                                                    // });
                                              
                                                    _notifikasi = deleteAlbum(snapshot.data![index].pk.toString());

                                                    Navigator.pushReplacement(context, MaterialPageRoute(
                                                      builder: ( (context) => const NotifikasiPage())));
                                                    }, 
                                                icon: Icon(Icons.delete), color: Colors.red),
                                        
                                                subtitle: Text(snapshot.data![index].fields.description),
                                            )
                                        ),
                                    )
                                    
                            );
                            }
                        }
                    }
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () => 
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => 
                      const NotifikasiFormPage()),
                    ),
                  tooltip: 'Add',
                  child: const Icon(Icons.add),
                  backgroundColor: Color(0xFF048353),
            ),
            bottomNavigationBar: MyBottomNavBar(
                      key: GlobalKey(debugLabel: "BottomNavBar"),
                      selectedIndex: 3,
            ),
        );
    }
}