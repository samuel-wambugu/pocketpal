import 'package:flutter/material.dart';

class transaction extends StatefulWidget {
  const transaction({super.key});

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Transfers'),
        backgroundColor: Colors.grey[700],
      ),
      body: Container(
        color: Colors.grey[900],
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4.0, 8.0, 8.0,8.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 8.0),
                          alignment: Alignment.centerLeft,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text("Same bank",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 18.0,
                          ),
                          ),
                        ),
                      ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 8.0, 8.0,8.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0),
                        alignment: Alignment.centerLeft,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text("Different bank",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 8.0, 8.0,8.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0),
                        alignment: Alignment.centerLeft,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text("Withdraw",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 8.0, 8.0,8.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0),
                        alignment: Alignment.centerLeft,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text("Deposit",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
