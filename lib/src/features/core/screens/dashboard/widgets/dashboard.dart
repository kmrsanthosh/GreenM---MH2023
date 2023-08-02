import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_engg_project/src/features/tests/ishihara_assessment/widgets/ishihara_assessment_widget.dart';
import 'package:software_engg_project/src/features/tests/math_assessment/widgets/math_assessment_widget.dart';

import '../../../../../../global.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../../authentication/screens/welcome/welcome_screen.dart';
import '../../../../authentication/user_details/user_details.dart';
import '../../../../tests/listening_assessment/widgets/listening_assessment_widget.dart';
import '../utils/constants.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {

    if (fullName == null || fullName == '') {
      fullName = "User";
    }

    if (profilepic == null) {
      profilepic = "https://via.placeholder.com/150";
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    'assets/images/dashboard/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  // account icon
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundImage:
                      NetworkImage(profilepic!),
                      backgroundColor: Colors.transparent,
                    ),
                    onTap:() async {
                      await AuthenticationRepository.instance.logout();
                      Get.to(() => WelcomeScreen());
                    },
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),



            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),



              Text(
                    fullName!,
                    style: GoogleFonts.bebasNeue(fontSize: 45, color: Colors.black),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),

            const SizedBox(height: 25),

            // smart devices grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Assessments",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // grid
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[

                  InkWell(
                    borderRadius: BorderRadius.circular(24),
                    splashColor: Colors.grey[900],
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color.fromARGB(44, 164, 167, 189),

                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:0, top: 25),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(Icons.calculate_outlined, size: 90, color: Colors.black,)
                                  ),
                                ),
                              ),
                            ),


                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:0, top: 0, bottom: 10),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Dyscalculia",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                      ),
                      onTap: () {
                        Get.to (() => math_assessment());
                      },
                    ),
                    onTap: () {},
                  ),


                  InkWell(
                    borderRadius: BorderRadius.circular(24),
                    splashColor: Colors.grey[900],
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color.fromARGB(44, 164, 167, 189),

                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:0, top: 25),
                                child: Center(
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Icon(Icons.hearing_rounded, size: 85, color: Colors.black,)
                                  ),
                                ),
                              ),
                            ),


                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:0, top: 0, bottom: 0),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Listening Assessment",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                      ),
                      onTap: () {
                        Get.to (() => listening_assessment());
                      },
                    ),
                    onTap: () {},
                  ),

                  InkWell(
                    borderRadius: BorderRadius.circular(24),
                    splashColor: Colors.grey[900],
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color.fromARGB(44, 164, 167, 189),

                        ),
                        child: Column(
                          children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:0, top: 25),
                                child: Center(
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Icon(Icons.remove_red_eye_outlined, size: 85, color: Colors.black,)
                                  ),
                                ),
                              ),
                            ),


                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:0, top: 0, bottom: 0),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Ishihara Assessment",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                      ),
                      onTap: () {
                        Get.to (() => ishihara_assessment());
                      },
                    ),
                    onTap: () {},
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }



}



