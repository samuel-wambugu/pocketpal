import 'package:flutter/material.dart';



class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  int setindex = 0;

  void tapitems(int index){
    setState(() {
      setindex = index;
    });
    if (setindex == 0){
      Navigator.pushReplacementNamed(context, '/home');
    }
    else if (setindex == 1){
      Navigator.pushReplacementNamed(context, '/account');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("mobile banking"),
          backgroundColor: Colors.grey[700],
          centerTitle: true,
          // actions: <Widget>[
          //   // IconButton(
          //   //   icon: Icon(Icons.menu),
          //   //   onPressed: () {},
          //   // )
          // ],
        ),
        body: Container(
            color: Colors.grey[900],
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/loading');
                        },
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0),
                            height: 50.0,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors. grey[700],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text('Check the balance',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/loading');
                        },
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0),
                            height: 50.0,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors. grey[700],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text('Transaction history',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/transaction');
                        },
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0),
                            height: 50.0,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors. grey[700],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text('Transfer money',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: setindex,
          onTap: tapitems,
          items:  [
            BottomNavigationBarItem(
                label: "home",
                icon: Icon(Icons.home) ,
            ),
            BottomNavigationBarItem(
              label: "profile",
              icon: Icon(Icons.person),
            ),
          ],
      ),
    );
  }
}