import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/admin/home_admin.dart';

import '../pages/bottomnav.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFededeb),
      body: Stack(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
            padding: const EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 53, 51, 51), Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                        MediaQuery.of(context).size.width, 110.0))),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "Let's start with\nAdmin!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 5.0, bottom: 5.0),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 160, 160, 147)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: TextFormField(
                                controller: usernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter User Name';
                                  }
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter User",
                                    prefixIcon: Icon(Icons.person_outline),
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 160, 160, 147))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 5.0, bottom: 5.0),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 160, 160, 147)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Password",
                                    prefixIcon: Icon(Icons.password_outlined),
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 160, 160, 147))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              loginAdmin();
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  "LogIn",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("admin").get().then((snapshot) => {
          snapshot.docs.forEach((result) {
            if (result.data()['id'] != usernameController.text.trim()) {
              ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
                  backgroundColor: Colors.orangeAccent,
                  content: Text(
                    "Your id is not correct",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ))));
            } else if (result.data()['password'] != passwordController.text.trim()) {
              ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
                  backgroundColor: Colors.orangeAccent,
                  content: Text(
                    "Your password is not correct",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ))));
            } else {
              Route route = MaterialPageRoute(builder: (context) => const HomeAdmin());
              Navigator.pushReplacement(context, route);
            }
          })
        });
  }
}
