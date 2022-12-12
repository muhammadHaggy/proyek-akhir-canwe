import 'package:canwe/auth/login.dart';
import 'package:canwe/auth/profile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
        extendBodyBehindAppBar: true,
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
                                        "Please register to continue",
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Username",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                      labelText: "Confirm Password",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Already have an account? ",
                                  children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginPage(),
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
                                      "https://canwe.pythonanywhere.com/auth/register",
                                      {
                                        'username': username,
                                        'password1': password1,
                                        'password2': password2,
                                      });
                                  if (request.loggedIn && response['status']) {
                                    // Code here will run if the login succeeded.
                                    print("Register Successfull");
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
                                        () => Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProfilePage(),
                                              ),
                                            ));
                                  } else {
                                    // Code here will run if the login failed (wrong username/password).
                                    print("Register Failed");
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
                                        "Register",
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
