
import 'package:digital_flake_assess/Screens/Authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State createState() => _SignUpPageState();
}

class _SignUpPageState extends State {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 89),
                child: Text(
                  "Create an Account",
                  style:GoogleFonts.poppins(
                    fontSize:24,
                    fontWeight:FontWeight.w400,
                  )
                ),
              ),
              const SizedBox(height: 60),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Full Name",
                      style: GoogleFonts.poppins(
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                        color:const Color.fromRGBO(73, 73, 73, 1)
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(color:const Color.fromRGBO(218, 218, 218, 1),width: 1.3),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          fillColor: Color.fromRGBO(249, 249, 249, 1),
                          filled: true,
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      "Mobile number or Email",
                      style: GoogleFonts.poppins(
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                        color:const Color.fromRGBO(73, 73, 73, 1)
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(color:const Color.fromRGBO(218, 218, 218, 1),width: 1.3),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          fillColor: const Color.fromRGBO(249, 249, 249, 1),
                          filled: true,
                          border: InputBorder.none,
                        )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                        color:const Color.fromRGBO(73, 73, 73, 1)
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(color:const Color.fromRGBO(218, 218, 218, 1),width: 1.3),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          fillColor: const Color.fromRGBO(249, 249, 249, 1),
                          filled: true,
                          border: InputBorder.none,
                        )
                      ),
                    ),
                  ],
                )
              ),
              const SizedBox(height: 90),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(81, 103, 235, 1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    "Create an account",
                    style: GoogleFonts.poppins(
                      fontWeight:FontWeight.w700,
                      fontSize:16,
                      color:const Color.fromRGBO(255, 255, 255, 1)
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Existing user? ",
                    style: GoogleFonts.poppins(
                      color:const Color.fromRGBO(98, 98, 98, 1),
                      fontWeight:FontWeight.w400,
                      fontSize:14
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                    },
                    child: Text(
                      "Log In",
                      style: GoogleFonts.poppins(
                        color:const Color.fromRGBO(42, 29, 139, 1),
                        fontWeight:FontWeight.w500,
                        fontSize:16
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}