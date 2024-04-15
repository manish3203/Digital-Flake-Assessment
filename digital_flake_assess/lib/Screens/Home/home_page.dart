import 'package:digital_flake_assess/Screens/Home/booking_slot.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 34.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/login_icon.png",scale: 2.2,
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    "Co-working",
                    style: GoogleFonts.poppins(
                      color:const Color.fromRGBO(83, 79, 79, 1),
                      fontWeight:FontWeight.w700,
                      fontSize:14
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 131,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(81, 103, 235, 1),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text(
                        "Booking history",
                        style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w500,
                          fontSize:14,
                          color:const Color.fromRGBO(255, 255, 255, 1)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookingSlot()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 147,
                        width: 147,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(77, 96, 209, 1),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Image.asset(
                          "assets/Book Work.png"
                        )
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "Book Work",
                      style: GoogleFonts.poppins(
                        fontWeight:FontWeight.w400,
                        fontSize:20,
                        color:const Color.fromRGBO(67, 62, 62, 1)
                      ),
                    ),
                    Text(
                      "Station",
                      style: GoogleFonts.poppins(
                        fontWeight:FontWeight.w400,
                        fontSize:20,
                        color:const Color.fromRGBO(67, 62, 62, 1)
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        height: 147,
                        width: 147,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(199, 207, 252, 1),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Image.asset(
                          "assets/meeting_room.png"
                        )
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "Meeting",
                      style: GoogleFonts.poppins(
                        fontWeight:FontWeight.w400,
                        fontSize:20,
                        color:const Color.fromRGBO(67, 62, 62, 1)
                      ),
                    ),
                    Text(
                      "room",
                      style: GoogleFonts.poppins(
                        fontWeight:FontWeight.w400,
                        fontSize:20,
                        color:const Color.fromRGBO(67, 62, 62, 1)
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}