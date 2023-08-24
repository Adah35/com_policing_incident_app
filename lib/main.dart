// ignore_for_file: prefer_const_constructors

import 'package:com_policing_incident_app/screens/forgot_password.dart';
import 'package:com_policing_incident_app/screens/login.dart';
import 'package:com_policing_incident_app/screens/onboard_screen/onboard.dart';
import 'package:com_policing_incident_app/screens/pages/home_page.dart';
import 'package:com_policing_incident_app/screens/register.dart';
import 'package:com_policing_incident_app/screens/welcome_screen.dart';
//flimport 'package:com_policing_incident_app/screens/screen_selector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Community Policing and Incident Reporing App  ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Onboard(),
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginPage(),
        '/register': (context) => Register(),
        '/forgot': (context) => ForgotPassword(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
