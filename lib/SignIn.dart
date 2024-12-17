import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasl/SignUp.dart';
import 'package:tasl/homePage.dart';
import 'package:tasl/main.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String gmail;
  late String pass;
  final GlobalKey<FormState> globalKey = GlobalKey();
  bool rememberValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign in",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SvgPicture.asset("assets/avatar1.svg"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Your Company Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: globalKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      bool validGmail =
                          RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                              .hasMatch(value!);
                      if (value.isEmpty || validGmail == false) {
                        return "invaild data";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        gmail = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                      label: Text("Email"),
                      prefixIcon: Icon(Icons.mail),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "invaild data";
                      } else {
                        setState(() {
                          pass = value;
                        });
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      bool userFound = false;
                      if (globalKey.currentState!.validate()) {
                        for (var i = 0; i < userList.length; i++) {
                          if (userList[i].gmail == gmail &&
                              userList[i].pass == pass) {
                            userFound = true;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Homepage(userInfo: userList[i]);
                                },
                              ),
                            );
                          }
                        }
                        if (!userFound) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Invalid email or password")),
                          );
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10)),
                      width: 80,
                      height: 40,
                      child: const Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.blueAccent),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUp();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    " Sign Up",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
