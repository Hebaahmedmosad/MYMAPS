import 'package:demoday4/models/user.dart';
import 'package:demoday4/screens/userDetails.dart';
import 'package:demoday4/screens/widget/myCard.dart';
import 'package:demoday4/services/userService.dart';
import 'package:demoday4/utils.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool loading = true;
  List<User> users = [];

  getUserList() async {
    users = await UserService().getUsers();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Screen"),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        pushPage(context, UserDetails(users[index]));
                      },
                      child: MyCard(content: "${users[index].name}")),
                );
              },
            ),
    );
  }
}
