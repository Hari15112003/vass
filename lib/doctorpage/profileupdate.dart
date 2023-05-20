import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vass/doctorpage/doctorsprofile.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  TextEditingController qualification = TextEditingController();
  TextEditingController walkin = TextEditingController();
  TextEditingController call = TextEditingController();
  TextEditingController video = TextEditingController();
  TextEditingController chat = TextEditingController();
  String labelQualification = "Qualification";
  String labelWalkin = 'Walkin';
  String labelCall = 'Call';
  String labelVideo = 'Video';
  String labelChat = 'Chat';

  void dispose() {
    qualification.dispose();
    walkin.dispose();
    call.dispose();
    video.dispose();
    chat.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Update"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            textfield(labelQualification, qualification),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Consulation Fee",
                style: GoogleFonts.roboto(
                    fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ),
            textfield(labelWalkin, walkin),
            textfield(labelCall, call),
            textfield(labelVideo, video),
            textfield(labelChat, chat),
            SizedBox(
              height: height * 0.045,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorsProfile(
                                  call: call.text,
                                  chat: chat.text,
                                  video: video.text,
                                  qualification: qualification.text,
                                  walkin: walkin.text,
                                )));
                  },
                  child: Text("Update", style: TextStyle())),
            ),
          ],
        ),
      ),
    ));
  }

  Widget textfield(labeltext, controller) {
    return Padding(
      padding: EdgeInsets.only(left: 15, bottom: 8, right: 15, top: 8),
      child: TextField(
        maxLines: 20,
        minLines: 1,
        keyboardType: labeltext == 'Qualification'
            ? TextInputType.text
            : TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          enabled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.all(18),
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
