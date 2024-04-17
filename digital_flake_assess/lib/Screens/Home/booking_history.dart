import 'dart:convert';

import 'package:digital_flake_assess/Screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State {
  List<Map<String, dynamic>> bookings = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://demo0413095.mockable.io/digitalflake/api/get_bookings?user_id=1'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Map<String, dynamic>> slotHistory =
          List<Map<String, dynamic>>.from(jsonData['bookings']);
          print("fecth hostory");
          print(slotHistory);
      setState(() {
        bookings = slotHistory;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
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
            Expanded(
              child: bookings.isEmpty ? const Center(child: CircularProgressIndicator()) : SizedBox(
                width: double.infinity,
                height: 300,
                child: ListView.separated(
                  itemBuilder: (context, index){
                    return Container(
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
                                "${bookings[index]['workspace_id']}",
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
                                "${bookings[index]['workspace_name']}",
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
                                "${bookings[index]['booking_date']}",
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
                    );
                  }, 
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10,);
                  }, 
                  itemCount: bookings.length
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}