import 'package:apitask/screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../data/NetworkCaller.dart';
import '../../data/respon_wrapper.dart';
import '../../data/uitily/urls.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailcon=TextEditingController();
  final TextEditingController passcon=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailcon,
                decoration: InputDecoration(
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: passcon,
                decoration: InputDecoration(
                  hintText: 'password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                ),
              ),

              SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> paramer = {
                      "email":emailcon.text.trim().toString(),
                      "password":passcon.text.toString(),
                    };
                    final ResponseObject response =
                    await NetWorkCaller.postRequest(Urls.signup, paramer);
                    if (response.isusccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Registion siuccess")));
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>HomeScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Registion fails")));
                    }
                  },
                  child: Text("SignUp"))
            ],
          ),
        ),
      ),
    );
  }
}
