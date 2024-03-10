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
 bool _passwordVisible=false;
  @override
  void initState() {
    _passwordVisible = false;
  }

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
               obscureText: !_passwordVisible,
                controller: passcon,
                decoration: InputDecoration(
                  hintText: 'password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                 suffixIcon: IconButton(
                 icon: Icon(
                  // Based on passwordVisible state choose the icon
                 _passwordVisible
                   ? Icons.visibility
                   : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                     ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    }),
              ),),

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
