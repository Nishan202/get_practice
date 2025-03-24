import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/api_helper.dart';
import 'package:getx_practice/ui/home_screen.dart';
import 'package:getx_practice/ui/widgets/custom_button.dart';
import 'package:getx_practice/ui/widgets/custom_textfield.dart';

import '../getx/user_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final UserController _controller = Get.put(UserController(apiHelper: ApiHelper()));
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: EdgeInsets.all(15), child: Column(
        children: [
          const Align(alignment: Alignment.topLeft, child: Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),)),
          const SizedBox(height: 8,),
          const Align(alignment: Alignment.topLeft, child: Text('Please sign in your account to get started!', style: TextStyle(color: Colors.grey, fontSize: 16),)),
          const SizedBox(height: 15,),
          CustomTextfield(controller: _nameController, labelText: 'Name', inputType: TextInputType.emailAddress,),
          const SizedBox(height: 10,),
          CustomTextfield(controller: _emailController, labelText: 'Email', placeholder: 'Enter Email',),
          // const SizedBox(height: 10,),
          // CustomTextfield(controller: _phoneNoController, labelText: 'Phone N0', placeholder: 'Enter Phone No',),
          // const SizedBox(height: 10,),
          // CustomTextfield(controller: _passwordController, labelText: 'Password', placeholder: 'Enter Password',),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: TextButton(onPressed: (){}, child: Text('Forgot password')),
          // ),
          const SizedBox(height: 15,),
          Obx((){
            // if (_controller.isLoading.value) {
            //   // return const CircularProgressIndicator();
            // }
            if (_controller.errorMessage.isNotEmpty) {
              isLoading = true;
              return Center(child: Text(_controller.errorMessage.value));
              // isLoading = false;
              // setState(() {
              //
              // });
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_controller.errorMessage.value)));
            }
            return CustomButton(loading: _controller.isLoading.value, title: 'SignUp', onClick: () async {
              // isLoading = false;
              await _controller.createUser(name: _nameController.text, job: _emailController.text);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User Registered successfully')));
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              if(_controller.isUserCreated.value){
                _nameController.clear();
                _emailController.clear();
                _phoneNoController.clear();
                _passwordController.clear();
              }
            });
          }),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?', style: TextStyle(fontSize: 16),),
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Sign in', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),),)
            ],
          )
        ],
      ),),
    );
  }
}
