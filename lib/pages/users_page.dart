import 'package:flutter/material.dart';
import 'package:flutter_real_time_chat/models/user.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final users = [
    User(online: true, email: 'test1@test.com', name: 'Maria', uid: '1'),
    User(online: false, email: 'test2@test.com', name: 'Fernando', uid: '2'),
    User(online: true, email: 'test3@test.com', name: 'Lizeth', uid: '3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mi nombre',
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.exit_to_app, color: Colors.black),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
            // child: Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => ListTile(
          title: Text(users[i].name),
          leading: CircleAvatar(
            child: Text(users[i].name.substring(0, 2)),
          ),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: users[i].online ? Colors.green[300] : Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        separatorBuilder: (_, i) => const Divider(),
        itemCount: users.length,
      ),
    );
  }
}
