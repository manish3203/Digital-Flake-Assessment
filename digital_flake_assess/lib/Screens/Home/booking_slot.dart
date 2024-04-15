import 'package:digital_flake_assess/Screens/Home/home_page.dart';
import 'package:digital_flake_assess/Screens/Home/select_desk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

class BookingSlot extends StatefulWidget {
  const BookingSlot({super.key});

  @override
  State createState() => _BookingSlotState();
}

class _BookingSlotState extends State {

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
            SizedBox(
              height: 300,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 5/2,
                mainAxisSpacing: 7.0,
                crossAxisSpacing: 8.0,
                children: List.generate(timeSlot.length, (index) => GestureDetector(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    width: 152,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(240, 245, 255, 1),
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
                )
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