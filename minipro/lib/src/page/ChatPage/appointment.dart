import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    // CalendarFormat _calendarFormat = CalendarFormat.month;
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;

    return Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.only(left: 70),
            child: Text(
              'การนัดหมาย',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: const Color(0xFF9bb8cd),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(right: 140),
              child: Text(
                "เลือกวันที่ต้องการนัดหมาย",
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF000000)),
                ),
              ),
            ),
            CalendarPage(),
          ]),
        ));
  }
}

Widget CalendarPage() {
  return Container();
}
