import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasl/SignIn.dart';
import 'package:tasl/main.dart';
import 'package:tasl/userModel.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  late userModel user = userModel(
      name: "",
      pass: "",
      gmail: "",
      age: "",
      gender: "",
      status: "",
      recieveNoti: true);
  String? selectedGender = 'Male';
  bool receiveNotifications = false;
  bool termsValue = false;
  String statusValue = "Not Defined";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: globalKey,
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "invaild data";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              user.name = value;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              label: Text("Name"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "invaild data";
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              user.age = value;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              label: Text("age"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                        user.gmail = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
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
                        }
                        return null;
                      },
                      onChanged: (value) {
                        user.pass = value;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        label: Text("Password"),
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RadioListTile(
                      title: const Text("Male"),
                      value: "Male",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(
                          () {
                            selectedGender = value;
                            user.gender = selectedGender!;
                          },
                        );
                      },
                    ),
                    RadioListTile(
                      title: const Text("Female"),
                      value: "Female",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                          user.gender = selectedGender!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownMenu(
                        onSelected: (value) {
                          statusValue = value!;
                          user.status = statusValue;
                        },
                        label: const Text("Status"),
                        width: MediaQuery.of(context).size.width,
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(value: "Single", label: "Single"),
                          DropdownMenuEntry(value: "Married", label: "Married"),
                          DropdownMenuEntry(
                              value: "Devorced", label: "Devorced"),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Receive Notification",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            value: receiveNotifications,
                            onChanged: (value) {
                              setState(() {
                                receiveNotifications = value;
                                user.recieveNoti = receiveNotifications;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "I agree to the terms and conditions",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                          value: termsValue,
                          onChanged: (value) {
                            setState(() {
                              termsValue = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        if (termsValue == true &&
                            globalKey.currentState!.validate()) {
                          user.gender = selectedGender!;
                          user.status = statusValue;
                          userList.add(user);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SignIn();
                              },
                            ),
                          );
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
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
