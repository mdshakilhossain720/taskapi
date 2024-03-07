import 'package:apitask/data/NetworkCaller.dart';
import 'package:apitask/data/respon_wrapper.dart';
import 'package:apitask/data/uitily/urls.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController firstconroller = TextEditingController();
  TextEditingController lastcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextFormField(
                controller: emailcontroller,
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
                controller: firstconroller,
                decoration: InputDecoration(
                  hintText: 'Frist Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: lastcontroller,
                decoration: InputDecoration(
                  hintText: 'LastName',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: phonecontroller,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: passcontroller,
                decoration: InputDecoration(
                  hintText: 'password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> paramer = {
                      "email": emailcontroller.text.trim().toString(),
                      "firstName": firstconroller.text.trim().toString(),
                      "lastName": lastcontroller.text.trim().toString(),
                      "mobile": phonecontroller.text.trim().toString(),
                      "password": passcontroller.text.toString(),
                    };
                    final ResponseObject response =
                    await NetWorkCaller.postRequest(Urls.signup, paramer);
                    if (response.isusccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Registion siuccess")));
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>LoginPage()));
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
