import 'package:canwe/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    late String username, firstName, lastName, email, bioSingkat;
    late DateTime tanggalLahir;

    Future<Profile> getProfileInfo() async {
      final response = await request
          .get("https://canwe.pythonanywhere.com/user/profile/json");
      return Profile.fromJson(response);
    }

    return Scaffold(
      body: FutureBuilder(
        future: getProfileInfo(),
        builder: (context, AsyncSnapshot<Profile> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var profile = snapshot.data;
            return Form(
              key: _formKey,
              child: LayoutBuilder(
                builder: (p0, p1) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: p1.maxHeight),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    initialValue: profile!.username,
                                    decoration: InputDecoration(
                                        labelText: "Username",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        )),
                                    onChanged: (String? value) {
                                      setState(() {
                                        profile.username = value!;
                                      });
                                    },
                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                      setState(() {
                                        username = value!;
                                      });
                                    },
                                    // Validator sebagai validasi form
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Username tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    initialValue: profile.firstName,
                                    decoration: InputDecoration(
                                        labelText: "first name",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        )),
                                    onChanged: (String? value) {
                                      setState(() {
                                        profile.firstName = value!;
                                      });
                                    },
                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                      setState(() {
                                        firstName = value!;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    initialValue: profile.lastName,
                                    decoration: InputDecoration(
                                        labelText: "last name",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        )),
                                    onChanged: (String? value) {
                                      setState(() {
                                        profile.lastName = value!;
                                      });
                                    },
                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                      setState(() {
                                        lastName = value!;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    initialValue: profile.email,
                                    decoration: InputDecoration(
                                        labelText: "Email address",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        )),
                                    onChanged: (String? value) {
                                      setState(() {
                                        profile.email = value!;
                                      });
                                    },
                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                      setState(() {
                                        email = value!;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InputDatePickerFormField(
                                    fieldLabelText: "Tanggal Lahir",
                                    initialDate: profile.tanggalLahir,

                                    // Menambahkan behavior saat data disimpan
                                    onDateSaved: (DateTime value) {
                                      setState(() {
                                        tanggalLahir = value;
                                      });
                                    },
                                    firstDate:
                                        DateTime.fromMicrosecondsSinceEpoch(0),
                                    lastDate: DateTime.now(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    initialValue: profile.bioSingkat,
                                    decoration: InputDecoration(
                                        labelText: "Bio Singkat",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        )),
                                    onChanged: (String? value) {
                                      setState(() {
                                        profile.bioSingkat = value!;
                                      });
                                    },
                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                      setState(() {
                                        bioSingkat = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  final profileData = Profile(
                                    status: true,
                                    username: username,
                                    firstName: firstName,
                                    lastName: lastName,
                                    email: email,
                                    tanggalLahir: tanggalLahir,
                                    bioSingkat: bioSingkat,
                                  );
                                  print('valid');
                                  final response = await request.post(
                                    "https://canwe.pythonanywhere.com/user/profile/json",
                                    profileData.toJson(),
                                  );
                                  print(profileData.toJson());
                                  print(response);
                                  if (response["status"].toString() == "true") {
                                    // Code here will run if the login succeeded.
                                    print("Edit Profil Succesfull");
                                    setState(() {});
                                  } else {
                                    // Code here will run if the login failed (wrong username/password).
                                    print("Edit profil failed");
                                  }
                                }
                              },
                              child: const Text(
                                "Save Changes",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
