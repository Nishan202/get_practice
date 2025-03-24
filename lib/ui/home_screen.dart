
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/api_helper.dart';

import '../getx/user_controller.dart';

class HomeScreen extends StatelessWidget {
  final UserController _controller = Get.put(UserController(apiHelper: ApiHelper()));
  HomeScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        drawer: Drawer(
          width: 300,
          elevation: 11,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                // child: ElevatedButton(onPressed: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateUserScreen())), child: Text("Create user")),
              ),
            ],
          ),
        ),
        body: Obx((){
          if (_controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_controller.errorMessage.isNotEmpty) {
            return Center(child: Text(_controller.errorMessage.value));
          }

          return _controller.users.isNotEmpty ? ListView.builder(itemCount: _controller.users.length, itemBuilder: (_, index){
            final user = _controller.users[index];
            return Card(
              child: InkWell(
                // onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsScreen(user: user,))),
                child: ListTile(
                  leading: CircleAvatar(radius: 30, backgroundImage: NetworkImage(user.avatar!),),
                  title: Row(children: [Text(user.firstName, style: TextStyle(color: Colors.black),), SizedBox(width: 10,), Text(user.lastName, style: TextStyle(color: Colors.black),)],),
                  subtitle: Text(user.email, style: TextStyle(color: Colors.black),),
                ),
              ),
            );
          }) : Center(child: Text("No data!!"),);
        })
    );
  }
}