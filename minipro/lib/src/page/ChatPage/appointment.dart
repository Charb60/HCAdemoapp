import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  DateTime _startDate = DateTime.now();
  // DateTime _endDate = DateTime.now().add(Duration(days: 7));
  TimeOfDay _startTime = TimeOfDay.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _startTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกวันที่ต้องการนัดหมาย'),
        backgroundColor: const Color(0xFF9bb8cd),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('วัน/เวลา ที่เลือก',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color(0xFF000000),
                )),
            SizedBox(height: 20),
            Text(
              'วันที่: ${DateFormat('dd-MM-yyyy').format(_startDate)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'เวลา: ${_startTime.format(context)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectStartDate(context),
              child: Text('เลือกวันที่',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: const Color(0xFF000000),
                  )),
            ),
            ElevatedButton(
              onPressed: () => _selectStartTime(context),
              child: Text('เลือกเวลา',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: const Color(0xFF000000),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
