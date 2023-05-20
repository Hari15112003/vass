import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vass/doctorpage/profileupdate.dart';
import 'package:vass/patientpage/profile.dart';

class DoctorsProfile extends StatelessWidget {
  // final name;
  final walkin;
  final call;
  final video;
  final chat;
  final qualification;

  const DoctorsProfile(
      {super.key,
      required this.walkin,
      required this.call,
      required this.video,
      required this.chat,
      required this.qualification});

  @override
  Widget build(BuildContext context) {
    String name = "Harish";
    String majorRole = "Physician";
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.24,
              width: double.infinity,
              color: Colors.amber,
              child: Stack(
                children: [
                  Text("My Profile"),
                  //TODO:Image set
                  CircleAvatar(
                    // backgroundImage: ,
                    radius: 50,
                  ),
                  Positioned(
                      top: 89,
                      child: container(
                          name, qualification, majorRole, height, width))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Consulation Fee",
                      style: GoogleFonts.roboto(
                          fontSize: 21, fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileUpdate()));
                      },
                      icon: Icon(Icons.edit))
                ],
              ),
            ),
            Center(
              child: Container(
                height: height * 0.27,
                width: width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(21)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget container(name, qualification, majorRole, height, width) {
    return Container(
        height: height * 0.16,
        width: width * 0.6,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(21)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
            ),
            Text(majorRole),
            Text(qualification)
          ],
        ));
  }
}
