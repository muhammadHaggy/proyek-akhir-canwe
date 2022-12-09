import 'package:canwe/auth/display_profile.dart';
import 'package:canwe/auth/profile.dart';
import 'package:canwe/auth/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
        body: Padding(
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              TweenAnimationBuilder<double>(
                                duration: const Duration(milliseconds: 500),
                                tween: Tween(begin: 0, end: 1),
                                builder: (_, value, __) => Opacity(
                                  opacity: value,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.handshake,
                                          size: 60, color: Color(0xff21579C)),
                                      const SizedBox(height: 25),
                                      const Text(
                                        "Welcome,",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 35),
                                      ),
                                      Text(
                                        "Sign in to continue",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontSize: 35),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              TextFormField(
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
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
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
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  children: [
                                    TextSpan(
                                      text: 'Sign Up',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegisterPage(),
                                                ),
                                              )
                                            },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final response = await request.login(
                                      "https://canwe.pythonanywhere.com/auth/login",
                                      {
                                        'username': username,
                                        'password': password,
                                      });
                                  if (request.loggedIn && response['status']) {
                                    // Code here will run if the login succeeded.
                                    print("Login Succesfull");
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
                                    if (!mounted) return;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        response['message'],
                                        style: const TextStyle(),
                                      ),
                                      backgroundColor: Colors.red,
                                    ));
                                    print("Login failed");
                                  }
                                },
                                child: Container(
                                  width: 230,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 224, 227, 231),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 19),
                                      ),
                                      SizedBox(width: 15),
                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        color: Colors.black,
                                        size: 26,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
