import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String password1 = "";
  String password2 = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        body: Form(
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
                            decoration: InputDecoration(
                                hintText: "Username",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            onChanged: (String? value) {
                              setState(() {
                                username = value!;
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
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Enter your secure password',
                                labelText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            onChanged: (String? value) {
                              setState(() {
                                password1 = value!;
                              });
                            },
                            // Menambahkan behavior saat data disimpan
                            onSaved: (String? value) {
                              setState(() {
                                password1 = value!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Enter your password again!',
                                labelText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            onChanged: (String? value) {
                              setState(() {
                                password2 = value!;
                              });
                            },
                            // Menambahkan behavior saat data disimpan
                            onSaved: (String? value) {
                              setState(() {
                                password2 = value!;
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
                          final response = await request.login(
                              "https://canwe.pythonanywhere.com/auth/register",
                              {
                                'username': username,
                                'password1': password1,
                                'password2': password2,
                              });
                          if (request.loggedIn) {
                            // Code here will run if the login succeeded.
                            print("Register Successfull");
                          } else {
                            // Code here will run if the login failed (wrong username/password).
                            print("Register Failed");
                          }
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
