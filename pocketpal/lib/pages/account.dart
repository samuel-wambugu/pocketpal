import 'package:flutter/material.dart';
import 'package:mobile_banking/pages/classes.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}


class _accountState extends State<account> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 30.0,
          letterSpacing: 1.0,
        ),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Enter your account number:",
              style: TextStyle(
                color: Colors.grey,
              ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'account number',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: Text("Enter your account number:",
                  style: TextStyle(

                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'account number',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,15.0,0,0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                  ),
                    onPressed: (){
                    // load_data();
                    },
                    child: Text("Login",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 18.0,
                    ),
                    ),
                ),
              ),
              Text("if you have not created an account:",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 18.0,
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/classes');
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline), // Makes it look like a link
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
