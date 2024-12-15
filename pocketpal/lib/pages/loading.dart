import 'package:flutter/material.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Balance",
        style: TextStyle(
          color: Colors.grey[500],
        ),
        ),
        backgroundColor: Colors.grey[700],
      ),
     body: Container(
         color: Colors.grey[900],
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 color: Colors.grey[750],
                 child: TextField(
                   cursorColor: Colors.grey[700],
                   decoration: InputDecoration(
                     hintText: 'Enter your pin', // Placeholder text
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey,
                      ),
                    ),
                     focusedBorder: UnderlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.grey,
                       ),
                   ),
                     border: InputBorder.none
                 ),

               ),
             ),
             ),
           ],

         ),
       ),
    );
  }
}
