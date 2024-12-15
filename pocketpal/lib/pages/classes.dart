import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Myscreen extends StatefulWidget {
  const Myscreen({super.key});

  @override
  State<Myscreen> createState() => _MyscreenState();
}

class _MyscreenState extends State<Myscreen> {
  
  final TextEditingController emptytextfeild = TextEditingController();
  final TextEditingController   emptyidnumber = TextEditingController();
  final TextEditingController  emptydate = TextEditingController();
  final TextEditingController emptypassword = TextEditingController();
  final TextEditingController emptyconfirm = TextEditingController();
  List<Map<String, String>> accounts = [];

  bool isvisible = true;
  bool conisvible = true;
  String? errorMessage;
  String? errormessage;
  String? idnumber;
  String? date;
  String? password;
  String? confirm;
  String? Name;
  int? Id,DOE,pass;



//loading of data
 void load_data() async {
      SharedPreferences prefs =  await SharedPreferences.getInstance();
      String? accountdata = prefs .getString('accounts');
      if (accountdata != null) {
        Map<String, Map<String, String>> accounts = Map<String, Map<String, String>>.from(
          jsonDecode(accountdata).map((key, item) => MapEntry(key, Map<String, String>.from(item))),
        );

          String? Name = emptytextfeild.text.trim();
          String? Pin = emptypassword.text.trim();
          if(accounts.containsKey(Name) && accounts[Name] ? ['Pin'] == Pin){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successful')));
          }else{
            setState(() {
              errorMessage = 'Invalid username or password';
            });
          }
      }else{
        setState(() {
          errorMessage = "no account found";
        });
      }
  }
  // save the data
  _saveData(Name,Id,DOE,pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Store account data using the username as the key
    accounts[Name] = {
      'Id': Id,
      'date': DOE,
      'Pin' : pass,

    };

    // Save updated accounts map as a JSON string
    prefs.setString('accounts', jsonEncode(accounts));
  }


  @override
  void dispose() {
    emptytextfeild.dispose();
    emptyidnumber.dispose();
    emptyconfirm.dispose();
    emptydate.dispose();
    emptypassword.dispose();
    super.dispose();
  }

  void validation() {
    setState(() {
      if (emptytextfeild.text.trim().isEmpty) {
        errormessage = "FullName field is empty";
      } else {
        errormessage = null;
      }
      if (emptyidnumber.text.trim().isEmpty) {
        idnumber = "This field is empty";
      }else if(emptyidnumber.text.trim().length < 8){
        idnumber = "numbers are less than 8";
      } else if(emptyidnumber.text.trim().length > 8){
        idnumber = "numbers are more than 8";
      }
      else {
        idnumber = null;
      }
      if (emptydate.text.trim().isEmpty) {
        date = "This field is empty";
      } else {
        date = null;
      }
      if (emptypassword.text.trim().isEmpty) {
        password = "This field is empty";
      } else {
        password = null;
      }
      if (emptyconfirm.text.trim().isEmpty) {
        confirm = "This field is empty";
      }else if(emptyconfirm.text != emptypassword.text){
        confirm = "doesn't match the password";
      }
      else {
        confirm = null;
      }
      if(password == null && confirm == null && date == null && errormessage == null && idnumber == null){
        notification();
      }
    });
  }

  // notifaction to show the user he/ she has successfully created an account
  void notification(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
          title: Text("Account created"),
          content: Text("you have succesfully crested an account"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home'); // Close the dialog
                },
                child: Text("OK"),
              ),
            ],
          );
        },
    );
  }
  // Create a reusable widget for the account form
  Widget createAccount() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Enter your Fullname:",
            style: TextStyle(
              fontSize: 18,
              color:  Colors.grey,
            ),
          ),
          TextField(
            controller: emptytextfeild,
            cursorColor: Colors.grey[700],
            decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  border: InputBorder.none,
              hintText: "Full Name",
              errorText: errormessage,
            ),
            style: TextStyle(
                color: Colors.grey[400]
            ),
          ),
          const Text(
            "Enter your Id number:",
            style: TextStyle(
              fontSize: 18,
              color:  Colors.grey,
            ),
          ),
          TextField(
            controller: emptyidnumber,
            cursorColor: Colors.grey[700],
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              border: InputBorder.none,
              hintText: "ID number(equal to 8)",
              errorText: idnumber,
            ),
            keyboardType: TextInputType.number,
            style: TextStyle(
                color: Colors.grey[400]
            ),
          ),
          const Text(
            "Enter your date of birth:",
            style: TextStyle(
              fontSize: 18,
              color:  Colors.grey,
            ),
          ),
          TextField(
            controller: emptydate,
            cursorColor: Colors.grey[700],
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              border: InputBorder.none,
              hintText: 'Date of Birth (DD/MM/YYYY)',
              errorText: date,
            ),
            keyboardType: TextInputType.number,
            style: TextStyle(
                color: Colors.grey[400]
            ),
          ),
          const Text(
            "Enter your Pin:",
            style: TextStyle(
              fontSize: 18,
              color:  Colors.grey,
            ),
          ),
          TextField(
            maxLength: 4,
            obscureText: isvisible,
            controller: emptypassword,
            cursorColor: Colors.grey[700],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      isvisible = !isvisible; // Toggle password visibility
                    });
                  },
                  icon:  Icon(
                    isvisible ? Icons.visibility : Icons.visibility_off,
                  ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              border: InputBorder.none,
              hintText: "Pin max(4)",
              errorText: password,
            ),
            style: TextStyle(
                color: Colors.grey[400]
            ),
          ),
          const Text(
            "Confirm your Pin:",
            style: TextStyle(
              fontSize: 18,
              color:  Colors.grey,
            ),
          ),
          TextField(
            maxLength: 4,
            obscureText: conisvible,
            controller: emptyconfirm,
            cursorColor: Colors.grey[700],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              border: InputBorder.none,
              hintText: "Confirm Pin max(4)",
              errorText: confirm,
              suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      conisvible = !conisvible;
                    });
                  },
                  icon: Icon(
                      conisvible? Icons.visibility: Icons.visibility_off)
              ),
            ),
            style: TextStyle(
              color: Colors.grey[400]
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                   child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800],

                      ),
                      onPressed:(){
                        validation();
                        _saveData(
                            emptytextfeild.text,
                            emptyidnumber,
                            emptydate,
                            emptypassword
                        );
                      },
                      child: Text("create",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                 ),
            ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
          title:Text("Create Account",
          style: TextStyle(
            color: Colors.grey[500],
          ),
          ),
      ),
      body: Container(
        color: Colors.grey[900],
        child: ListView(
          children: [
            createAccount(),
          ],
        ),
      ),
    );
  }
}

