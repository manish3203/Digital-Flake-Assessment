import 'package:digital_flake_assess/Screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectDesk extends StatefulWidget {
  const SelectDesk({super.key});

  @override
  State createState() => _SelectDeskPage();
}

class _SelectDeskPage extends State {

  Future<dynamic> _confirmDialogBox() async{
    return await showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Text(
                "Confirm booking",
                style: GoogleFonts.poppins(
                  fontWeight:FontWeight.w400,
                  fontSize:12,
                  color:const Color.fromRGBO(73, 73, 73, 1)
                ),
              ),
              const Spacer(),
              GestureDetector(
                child: Image.asset(
                  "assets/ic_round.png",scale: 0.9,
                )
              ),
            ],
          ),
          actions: [
            const Divider(color: Color.fromRGBO(0, 0, 0, 0.2),thickness: 1.0),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Desk ID : ",
                  style: GoogleFonts.poppins(
                    fontWeight:FontWeight.w400,
                    fontSize:10,
                    color:const Color.fromRGBO(148, 148, 148, 1)
                  ),
                ),
                Text(
                  "12345",
                  style: GoogleFonts.poppins(
                    fontWeight:FontWeight.w400,
                    fontSize:12,
                    color:const Color.fromRGBO(73, 73, 73, 1)
                  ),
                ),
                const SizedBox(width: 80,),
                Text(
                  "Desk 14",
                  style: GoogleFonts.poppins(
                    fontWeight:FontWeight.w400,
                    fontSize:14,
                    color:const Color.fromRGBO(73, 73, 73, 1)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Slot:",
                  style: GoogleFonts.poppins(
                    fontWeight:FontWeight.w400,
                    fontSize:10,
                    color:const Color.fromRGBO(148, 148, 148, 1)
                  ),
                ),
                Text(
                  "Wed 31 May, 05:00PM-06:00PM",
                  style: GoogleFonts.poppins(
                    fontWeight:FontWeight.w400,
                    fontSize:12,
                    color:const Color.fromRGBO(73, 73, 73, 1)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 34,
                  width: 159,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(81, 103, 235, 1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    "Confirm",
                    style: GoogleFonts.poppins(
                      fontWeight:FontWeight.w700,
                      fontSize:16,
                      color:const Color.fromRGBO(255, 255, 255, 1)
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Available desks",
                    style: GoogleFonts.poppins(
                      fontWeight:FontWeight.w400,
                      fontSize:20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              "Wed 31 May , 05:00PM-06:00PM",
              style: GoogleFonts.poppins(
                fontWeight:FontWeight.w400,
                fontSize:13,
              ),
            ),
            SizedBox(
              height: 300,
              child: GridView.count(
                crossAxisCount: 6,
                childAspectRatio: 1,
                mainAxisSpacing: 7.0,
                crossAxisSpacing: 8.0,
                children: List.generate(40, (index) => GestureDetector(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(240, 245, 255, 1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: const Color.fromRGBO(199, 207, 252, 1))
                    ),
                    child: Text(
                      "${index+1}",
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
                _confirmDialogBox();
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
                  "Book Desk",
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