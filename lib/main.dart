import 'package:flutter/material.dart';
import 'package:vass/doctorpage/doctorsprofile.dart';
import 'package:vass/doctorpage/profileupdate.dart';
import 'package:vass/patientpage/profile.dart';
import 'package:vass/patientpage/signup.dart';

import 'patientpage/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProfileUpdate());
  }
}
