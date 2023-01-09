import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final usr=FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,width: 200,color: Colors.greenAccent,
        ),
        Text(usr.email!),
        ElevatedButton(onPressed: (){
          FirebaseAuth.instance.signOut();
        }, child: Text("LogOut"))
      ],
    );
  }
}
