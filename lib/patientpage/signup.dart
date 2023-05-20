import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:vass/patientpage/profile.dart';

enum gender { Male, Female, Others }

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController hospitalName = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  String? selectedValue;
  List<String> hospital = <String>['One', 'Two', 'Three', 'Four'];
  final _formKey = GlobalKey<FormState>();

  String hintHospital = "Choose Hospital";
  String hintAddress = "Address";
  String hintLocation = "Location";
  String hintCountry = "Choose Country";
  String hintMobileNumber = "Mobile No";
  String hintDateOfBirth = "Date of Birth";
  String hintName = "Name";

  gender? _selectedGender;

  String Gender = '';

  bool s = true;
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
    hospitalName.dispose();
    dateOfBirth.dispose();
    country.dispose();
    mobileNumber.dispose();
    address.dispose();
    location.dispose();
    state.dispose();
    city.dispose();
    Gender = "";
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.24,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(19),
                        bottomRight: Radius.circular(19))),
                child: Stack(
                  children: [
                    Positioned(
                        top: height * 0.03,
                        left: height * 0.18,
                        right: height * 0.03,
                        child: Text(
                          "Register",
                          style: GoogleFonts.alice(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        )),
                    Positioned(
                      left: width * 0.32,
                      height: height * 0.3,
                      child: CircleAvatar(
                        radius: height * 0.08,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.09,
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
                      Icons.arrow_drop_down_outlined,
                      color: Colors.black,
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
              TextWidget(hintName, name, "Please enter the Name"),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: dateOfBirth,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    icon: Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                    labelText: hintDateOfBirth,
                    hintText: hintDateOfBirth,
                    hintStyle: GoogleFonts.rubik(),
                    labelStyle: GoogleFonts.rubik(
                        color: Color.fromARGB(255, 104, 101, 101)),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      setState(() {
                        dateOfBirth.text = formattedDate.toString();
                      });
                    } else {
                      print('Not Selected');
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: CSCPicker(
                  // layout: Layout.vertical,
                  flagState: CountryFlag.ENABLE,
                  dropdownDecoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color.fromARGB(253, 0, 0, 0),
                    ),
                  ),
                  dropdownDialogRadius: 10.0,
                  disabledDropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 243, 233, 233),
                    border: Border.all(
                      color: Color.fromARGB(253, 0, 0, 0),
                    ),
                  ),

                  ///placeholders for dropdown search field
                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",

                  ///labels for dropdown
                  countryDropdownLabel: "Country",
                  stateDropdownLabel: "State",
                  cityDropdownLabel: "City",
                  showCities: true,
                  showStates: true,
                  searchBarRadius: 10.0,
                  onCountryChanged: (value) {
                    setState(() {
                      country.text = value;
                    });
                  },
                  onStateChanged: (value) {
                    setState(() {
                      state.text = value.toString();
                    });
                  },
                  onCityChanged: (value) {
                    setState(() {
                      ///store value in city variable
                      city.text = value.toString();
                    });
                  },
                ),
              ),
              TextWidget(hintMobileNumber, mobileNumber,
                  "Please enter the Mobilenumber"),
              Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    "Gender",
                    style: GoogleFonts.roboto(fontSize: 20),
                  )),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      horizontalTitleGap: 0,
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Male",
                        style: TextStyle(fontSize: 17),
                      ),
                      leading: Radio<gender>(
                        value: gender.Male,
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                            Gender = "Male";
                            print(Gender);
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      horizontalTitleGap: 0,
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Female",
                        style: TextStyle(fontSize: 17),
                      ),
                      leading: Radio(
                        value: gender.Female,
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                            Gender = "Female";
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      horizontalTitleGap: 0,
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        "Others",
                        style: TextStyle(fontSize: 17),
                      ),
                      leading: Radio(
                        value: gender.Others,
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                            Gender = "Others";
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              TextWidget(hintAddress, address, "Please enter the address"),
              TextWidget(hintLocation, location, "Please enter the location"),
              SizedBox(
                height: height * 0.04,
              ),
              Center(
                child: SizedBox(
                    width: width * 0.8,
                    height: height * 0.045,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 246, 203, 74)),
                        onPressed: () {
                          if (country.text.isEmpty ||
                              address.text.isEmpty ||
                              name.text.isEmpty ||
                              dateOfBirth.text.isEmpty ||
                              location.text.isEmpty) {
                            setState(() {
                              s = false;
                              print(s);
                            });
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Profile(
                                      state: state.text,
                                      city: city.text,
                                      Gender: Gender,
                                      HospitalName: hospitalName.text,
                                      Mobilenumber: mobileNumber.text,
                                      Name: name.text,
                                      DateOfBirth: dateOfBirth.text,
                                      Address: address.text,
                                      Location: location.text,
                                      Country: country.text,
                                    )));
                          }
                        },
                        child: Text("Register"))),
              ),
              SizedBox(
                height: height * 0.04,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget TextWidget(labeltext, controller, errortext) {
    return Padding(
      padding: EdgeInsets.only(left: 15, bottom: 8, right: 15, top: 8),
      child: TextField(
        keyboardType: labeltext == 'Mobile No'
            ? TextInputType.number
            : TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          enabled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(12)),
          // errorText: controller.text == null && s == false ? "errortext" : null,
          contentPadding: EdgeInsets.only(
            left: 12,
          ),
          border: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 30, color: Color.fromARGB(255, 0, 0, 0)),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          labelText: labeltext,
          hintText: labeltext,
          hintStyle: GoogleFonts.rubik(),
          labelStyle:
              GoogleFonts.rubik(color: Color.fromARGB(255, 104, 101, 101)),
        ),
      ),
    );
  }
}
