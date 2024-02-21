import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/src/user/userModel.dart';

class UserCard extends StatelessWidget {
  final ModelUser modelUser;

  UserCard({required this.modelUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              modelUser.userImage,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              modelUser.name,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Container(
              height: 2,
              width: 280,
              color: Color(0xFF666666),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              modelUser.phoneNumber.toString(),
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              modelUser.email,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              modelUser.line,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: const Color(0xFF000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
