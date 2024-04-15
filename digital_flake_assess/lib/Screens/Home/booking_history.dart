import 'package:digital_flake_assess/Screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0,bottom: 30),
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
                    "Booking history",
                    style: GoogleFonts.poppins(
                      fontWeight:FontWeight.w400,
                      fontSize:20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              height: 88,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 255, 1),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                       Text(
                        "Desk ID        :  ",
                        style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w400,
                          fontSize:12,
                          color:const Color.fromRGBO(137, 137, 137, 1)
                        ),
                      ),
                      Text(
                        "12345",
                        style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w400,
                          fontSize:14,
                          color:const Color.fromRGBO(30, 30, 30, 1)
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                       Text(
                        "Name          :  ",
                        style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w400,
                          fontSize:12,
                          color:const Color.fromRGBO(137, 137, 137, 1)
                        ),
                      ),
                      Text(
                        "Supriya Thete",
                        style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w400,
                          fontSize:14,
                          color:const Color.fromRGBO(30, 30, 30, 1)
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                       Text(
                        "Booked on  :  ",
                        style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w400,
                          fontSize:12,
                          color:const Color.fromRGBO(137, 137, 137, 1)
                        ),
                      ),
                      Text(
                        "31 may 2022 at 02:00PM",
                        style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w400,
                          fontSize:14,
                          color:const Color.fromRGBO(30, 30, 30, 1)
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}