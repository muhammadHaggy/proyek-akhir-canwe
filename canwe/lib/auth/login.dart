import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";
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
                                password = value!;
                              });
                            },
                            // Menambahkan behavior saat data disimpan
                            onSaved: (String? value) {
                              setState(() {
                                password = value!;
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
                              "https://canwe.pythonanywhere.com/auth/login", {
                            'username': username,
                            'password': password,
                          });
                          if (request.loggedIn) {
                            // Code here will run if the login succeeded.
                            print("Login Succesfull");
                          } else {
                            // Code here will run if the login failed (wrong username/password).
                            print("Login failed");
                          }
                        },
                        child: const Text(
                          "Login",
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
