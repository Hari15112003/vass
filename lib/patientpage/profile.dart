import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vass/patientpage/login.dart';

class Profile extends StatelessWidget {
  final String Name;

  final String Mobilenumber;

  final String HospitalName;

  final String DateOfBirth;

  final String Country;

  final String Address;

  final String Location;
  final String Gender;
  final String state;
  final String city;

  const Profile({
    super.key,
    required this.Gender,
    required this.Name,
    required this.Mobilenumber,
    required this.HospitalName,
    required this.DateOfBirth,
    required this.Country,
    required this.Address,
    required this.Location,
    required this.state,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 17),
                child: Icon(Icons.settings)),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: height * 0.20,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: CircleAvatar(
                      radius: height * 0.067,
                    ),
                  ),
                  Text(
                    Name,
                    style: GoogleFonts.rubik(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            RowWidget("Mobile Number", Mobilenumber),
            RowWidget("Date Of Birth", DateOfBirth),
            RowWidget('Gender', Gender),
            RowWidget("leading", "trailin"),
            RowWidget("Address", Address),
            RowWidget("Country", Country),
            state == '' ? RowWidget('State', state) : SizedBox(),
            city == '' ? RowWidget('City', city) : SizedBox(),
            SizedBox(
              height: height * 0.04,
            ),
            GestureDetector(
              onTap: () {
                print("abx");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_add_alt),
                  Text(
                    " Update",
                    style: GoogleFonts.amiko(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.028,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Text(
                "Logout",
                style: GoogleFonts.amiko(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }

  Widget RowWidget(leading, trailing) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: GoogleFonts.roboto(fontSize: 18),
          ),
          Text(
            trailing,
            style: GoogleFonts.roboto(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
