import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class module10 extends StatefulWidget {
  const module10({super.key});

  @override
  State<module10> createState() => _module10State();
}

class _module10State extends State<module10> {

  List users = [];

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users')
    );
    if(response.statusCode==200){
      setState(() {
        users=jsonDecode(response.body);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' API '),
        centerTitle: false ,
        elevation: 0,

        backgroundColor: Colors.deepPurple.shade400,
      ),

      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 78,
              width: double.infinity,
              child: Card(
                child: ListTile(
                 title: Text(users[index]['name']),
                subtitle: Text(users[index]['email']),
                leading: CircleAvatar(
                  child: Text(users[index]['name'][0]),
                ),
                ),
              ),
            );
          }
      ),
    );
  }
}
