import 'package:canwe/models/moderasi_donasi.dart';
import 'package:canwe/widgets/botton_navbar.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../widgets/logged_in_required.dart';

class ModerasiGalangDana extends StatefulWidget {
  const ModerasiGalangDana({super.key});
  @override
  State<ModerasiGalangDana> createState() => _ModerasiGalangDanaState();
}

class _ModerasiGalangDanaState extends State<ModerasiGalangDana> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    Future<DonasiModerasi?> getDonasiList() async {
      try {
        final response = await request
            .get("https://canwe.pythonanywhere.com/user/pending_task/");
        print(response);
        return DonasiModerasi.fromJson(response);
      } on FormatException catch (err) {
        print(err);
        return null;
      }
    }

    Future<Map<String, dynamic>> approveDonasi(int pk) async {
      final response = await request
          .get("https://canwe.pythonanywhere.com/user/moderator/approve/$pk");
      return response;
    }

    Future<Map<String, dynamic>> rejectDonasi(int pk) async {
      final response = await request
          .get("https://canwe.pythonanywhere.com/user/moderator/reject/$pk");
      return response;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Moderasi Konten",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getDonasiList(),
          builder: ((context, AsyncSnapshot<DonasiModerasi?> snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == null) {
              return const LoggedInRequired();
            } else {
              var listDonasi = snapshot.data!.data;
              return Center(
                child: ListView.separated(
                  itemCount: listDonasi.length,
                  itemBuilder: ((context, index) {
                    var donasi = listDonasi[index];
                    var donasiFields = donasi.fields;
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 44,
                                minHeight: 44,
                                maxWidth: 64,
                                maxHeight: 64,
                              ),
                              child: Image.network(
                                  "https://canwe.pythonanywhere.com" +
                                      donasiFields.urlFoto),
                            ),
                            title: Text(donasiFields.nama),
                            subtitle:
                                Flexible(child: Text(donasiFields.deskripsi)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: (() async {
                                  final response =
                                      await approveDonasi(donasi.pk);
                                  if (!mounted) return;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      response['message'],
                                      style: const TextStyle(),
                                    ),
                                  ));
                                  setState(() {});
                                }),
                                child: const Text("Approve"),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              TextButton(
                                onPressed: (() async {
                                  final response =
                                      await rejectDonasi(donasi.pk);
                                  if (!mounted) return;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      response['message'],
                                      style: const TextStyle(),
                                    ),
                                  ));
                                  setState(() {});
                                }),
                                child: const Text("Reject"),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.transparent,
                      height: 4,
                    );
                  },
                ),
              );
            }
          })),
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: 1,
      ),
    );
  }
}
