import 'package:flutter/material.dart';
import 'package:mobile_banking/pages/home.dart';
import 'package:mobile_banking/pages/loading.dart';
import 'package:mobile_banking/pages/signup.dart';
import 'package:mobile_banking/pages/transaction.dart';
import 'package:mobile_banking/pages/account.dart';
import 'package:mobile_banking/pages/classes.dart';

void main() =>  runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/loading': (context) => loading(),
    '/home': (context) => home(),
    '/signup': (context) => signup(),
    '/transaction': (context) => transaction(),
    '/account': (context) => account(),
    '/classes': (context) => Myscreen(),

  },
));



