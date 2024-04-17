
import 'dart:convert';

import 'package:digital_flake_assess/Screens/Authentication/signup_page.dart';
import 'package:digital_flake_assess/Screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State {

   //Controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //key
  final GlobalKey _formKey = GlobalKey();

  //password visible or not
  bool passwordVisible = false;

  // Future<void> _login() async {
  //   final url = Uri.parse('https://demo0413095.mockable.io/digitalflake/api/login');
  //   final response = await http.post(
  //     url,
  //     body: {
  //       'email': _emailController.text.trim(),
  //       'password': _passwordController.text.trim(),
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final responseData = json.decode(response.body);
  //     if (responseData['success'] == true) {
  //       // Navigate to home page or perform any other actions upon successful login
  //       print('Login successful');
  //     } else {
  //       // Show error message for incorrect email or password
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text('Login Failed'),
  //           content: Text('Invalid email or password.'),
  //           actions: <Widget>[
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(),
  //               child: Text('OK'),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   } else {
  //     // Show error message for server error
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text('Failed to connect to the server. Please try again later.'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 89),
                child: Center(
                  child: Image.asset(
                    "assets/login_icon.png",scale:1.0
                  ),
                ),
              ),
              Text(
                "Co-working",
                style:GoogleFonts.poppins(
                  fontSize:24,
                  fontWeight:FontWeight.w400,
                )
              ),
              const SizedBox(height: 60),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          fillColor: Color.fromRGBO(249, 249, 249, 1),
                          filled: true,
                          border: InputBorder.none
                        ),
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
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          fillColor: const Color.fromRGBO(249, 249, 249, 1),
                          filled: true,
                          border: InputBorder.none,
                          suffixIcon: IconButton( 
                            icon: (passwordVisible) ? const Icon(Icons.visibility_outlined,color: Color.fromRGBO(168, 168, 168, 1),)
                              : const Icon(Icons.visibility_off_outlined,color: Color.fromRGBO(168, 168, 168, 1),),
                            onPressed: (){
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          )
                        ),
                      ),
                    ),
                  ],
                )
              ),
              const SizedBox(height: 140),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const HomePage())));
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
                    "Login",
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
                    "New user? ",
                    style: GoogleFonts.poppins(
                      color:const Color.fromRGBO(98, 98, 98, 1),
                      fontWeight:FontWeight.w400,
                      fontSize:14
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));
                    },
                    child: Text(
                      "Create an account",
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