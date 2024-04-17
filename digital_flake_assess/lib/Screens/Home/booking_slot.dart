import 'dart:convert';

import 'package:digital_flake_assess/Screens/Home/home_page.dart';
import 'package:digital_flake_assess/Screens/Home/select_desk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:http/http.dart' as http;

class BookingSlot extends StatefulWidget {
  const BookingSlot({super.key});

  @override
  State createState() => _BookingSlotState();
}

class _BookingSlotState extends State {

    List<Map<String, dynamic>> timeSlots = [];

  Future<void> fetchTimeSlots(DateTime selectedDate) async {
    final String apiUrl =
        'https://demo0413095.mockable.io/digitalflake/api/get_slots?date=${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<Map<String, dynamic>> fetchedSlots =
          List<Map<String, dynamic>>.from(data['slots']);
      
      setState(() {
        timeSlots = fetchedSlots;
      });
    } else {
      throw Exception('Failed to load time slots');
    }
  }

  bool isActiveSlot(String slotName) {
  final activeSlot = timeSlots.firstWhere(
    (slot) => slot['slot_name'] == slotName && slot['slot_active'] == true,
    orElse: () => {},
  );
  return activeSlot.isNotEmpty;
}



  @override
  void initState() {
    super.initState();
    fetchTimeSlots(DateTime.now());
  }

  //list time slot
  List timeSlot = ["10:00AM - 11:00AM","11:00AM - 12:00PM","01:00PM - 02:00PM","02:00PM - 03:00PM","04:00PM - 05:00PM",
                  "05:00PM - 06:00PM","06:00PM - 07:00PM","07:00PM - 08:00PM","08:00PM - 09:00PM","09:00PM - 10:00PM"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 15,),
                  Text(
                    "Select Date & Slot",
                    style: GoogleFonts.poppins(
                      fontWeight:FontWeight.w400,
                      fontSize:20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            DatePicker(
              DateTime.now(),
              width: 80,
              height: 100,
              initialSelectedDate: DateTime.now(),
              selectionColor: const Color.fromRGBO(77, 96, 209, 1),
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(36, 34, 34, 1)
              ),
              dayTextStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(36, 34, 34, 1)
              ),
              monthTextStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(36, 34, 34, 1)
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: timeSlots.isEmpty ? const Center(child: CircularProgressIndicator()) : SizedBox(
                height: 300,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 5/2,
                  mainAxisSpacing: 7.0,
                  crossAxisSpacing: 8.0,
                  children: List.generate(timeSlot.length, (index) 
                  {
                    final slotName = timeSlot[index];
                    final isActive = isActiveSlot(slotName);
                    return GestureDetector(
                    onTap: (){},
                    child: Container(
                      alignment: Alignment.center,
                      width: 152,
                      decoration: BoxDecoration(
                        color: isActive ?Color.fromRGBO(227, 227, 227, 1) :const Color.fromRGBO(240, 245, 255, 1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: const Color.fromRGBO(199, 207, 252, 1))
                      ),
                      child: Text(
                        timeSlot[index],
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight:FontWeight.w400
                        ),
                      ),
                    ),
                  );
                  }
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SelectDesk()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(81, 103, 235, 1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  "Next",
                  style: GoogleFonts.poppins(
                    fontWeight:FontWeight.w700,
                    fontSize:16,
                    color:const Color.fromRGBO(255, 255, 255, 1)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}