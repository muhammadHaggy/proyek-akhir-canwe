import 'package:canwe/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import 'display_profile.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.grey[700],
                  size: 30,
                )),
          )
        ],
        leading: Container(),
        elevation: 0,
      ),
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
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
                                  const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Username",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    initialValue: profile!.username,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
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
                                  const SizedBox(height: 24),
                                  const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "First Name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    initialValue: profile.firstName,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
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
                                  const SizedBox(height: 24),
                                  const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Last Name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    initialValue: profile.lastName,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
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
                                  const SizedBox(height: 24),
                                  const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Email Address",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    initialValue: profile.email,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
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
                                  const SizedBox(height: 24),
                                  const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Tanggal Lahir",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  InputDatePickerFormField(
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
                                  const SizedBox(height: 24),
                                  const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Bio Singkat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    initialValue: profile.bioSingkat,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
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
                                  const SizedBox(height: 40),
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
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
                                    if (response["status"]) {
                                      // Code here will run if the login succeeded.
                                      print("Edit Profil Succesfull");
                                      if (!mounted) return;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          response['message'],
                                          style: const TextStyle(),
                                        ),
                                      ));
                                      Future.delayed(
                                          const Duration(seconds: 1),
                                          () => Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DisplayProfilePage(),
                                                ),
                                              ));
                                    } else {
                                      // Code here will run if the login failed (wrong username/password).
                                      print("Edit profil failed");
                                      if (!mounted) return;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          response['message'],
                                          style: const TextStyle(),
                                        ),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  }
                                },
                                child: Container(
                                  width: 200,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 224, 227, 231),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Save Changes",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 19),
                                      ),
                                      SizedBox(width: 15),
                                      Icon(
                                        Icons.save,
                                        color: Colors.black,
                                        size: 26,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
