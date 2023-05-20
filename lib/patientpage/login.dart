import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:vass/patientpage/otp.dart';
import 'package:vass/patientpage/signup.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String hospitalName = "S.V.clinic";
  String hospitalId = 'vas2156';
  String hintHospital = "Choose Hospital";
  String hintHospitalId = "Enter your Hospital ID";
  List<String> hospital = <String>['One', 'Two', 'Three', 'Four'];
  String? selectedValue;
  TextEditingController hospitalIdContoller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: height * 0.24,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(19),
                      bottomRight: Radius.circular(19))),
            ),
            Text(
              "Login",
              style:
                  GoogleFonts.alice(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            CircleAvatar(
              radius: height * 0.08,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: DropdownButtonFormField2(
                alignment: Alignment(-7, -9),
                isDense: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      gapPadding: 12,
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  labelText: hintHospital,
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  labelStyle: GoogleFonts.rubik(
                      color: Color.fromARGB(255, 104, 101, 101)),
                  contentPadding: EdgeInsets.only(left: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                items: hospital
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return hintHospital;
                  }
                  return null;
                },
                onChanged: (value) {},
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  height: 60,
                  padding: EdgeInsets.only(left: 20, right: 10),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            TextWidget(hintHospitalId, hospitalIdContoller, height, width),
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              width: width * 0.8,
              height: height * 0.045,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(230, 230, 190, 67)),
                onPressed: () {},
                child: Text(
                  "Login".toUpperCase(),
                  style: GoogleFonts.rubik(),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.15,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Otp()));
                      },
                      child: ListTile(
                        horizontalTitleGap: 0,
                        minLeadingWidth: 0,
                        contentPadding: EdgeInsets.all(0),
                        leading: Icon(
                          Icons.arrow_left,
                          size: 35,
                        ),
                        title: Text(
                          "Forget Id ?",
                          style: GoogleFonts.rubik(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: ListTile(
                        horizontalTitleGap: 0,
                        minVerticalPadding: 0,
                        contentPadding: EdgeInsets.all(0),
                        trailing: Icon(
                          Icons.arrow_right,
                          size: 35,
                        ),
                        title: Text(
                          "Register",
                          style: GoogleFonts.rubik(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register()));
                      },
                    ),
                  ),
                  SizedBox(
                    width: width * 0.18,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget TextWidget(hintHospitalId, hospitalIdController, heigth, width) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: hospitalIdContoller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.only(left: 12),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 5, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          labelText: hintHospitalId,
          hintText: hintHospitalId,
          hintStyle: GoogleFonts.rubik(),
          labelStyle:
              GoogleFonts.rubik(color: Color.fromARGB(255, 104, 101, 101)),
        ),
      ),
    );
  }
}
