import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();

  void dispose(){
    id.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_rounded,
            size: 100,
            color: Colors.greenAccent,
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
              controller: id,
              decoration: InputDecoration(
                  label: Text(
                    "Id",
                  ),
                  /*enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),*/
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)))),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
              label: Text(
                "Password",
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              /*enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))*/
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              signIn();
            },
            child: Text("Login"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Forgot password ?"),
          SizedBox(
            height: 20,
          ),
          Text("Sign up")
        ],
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: id.text.trim(),
        password: password.text.trim());
  }
}
