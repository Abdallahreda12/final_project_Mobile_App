import 'package:flutter/material.dart';
import 'package:tasl/main.dart';
import 'package:tasl/userModel.dart';

class UserProfilePage extends StatefulWidget {
  final userModel userInfo;
  final int index;

  const UserProfilePage(
      {super.key, required this.userInfo, required this.index});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(widget.userInfo),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  profileCard(Icons.person, "Name", widget.userInfo.name),
                  const SizedBox(height: 10),
                  profileCard(Icons.email, "Email", widget.userInfo.gmail),
                  const SizedBox(height: 10),
                  profileCard(
                      Icons.cake, "Age", widget.userInfo.age.toString()),
                  const SizedBox(height: 10),
                  profileCard(
                      Icons.transgender, "Gender", widget.userInfo.gender),
                  const SizedBox(height: 10),
                  profileCard(Icons.info, "Status", widget.userInfo.status),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Receive Notifications",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Switch(
                            value: widget.userInfo.recieveNoti,
                            activeColor: Colors.blueAccent,
                            onChanged: (value) {
                              setState(() {
                                userList[widget.index].recieveNoti = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header(userModel userInfo) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/OIP (1).jpeg'),
          ),
          const SizedBox(height: 10),
          Text(
            userInfo.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            userInfo.status,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget profileCard(IconData icon, String title, String value) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
    );
  }
}
