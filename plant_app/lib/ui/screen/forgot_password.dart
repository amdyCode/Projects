import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Constants.dart';
import 'package:plant_app/ui/screen/Signin_page.dart';
import 'package:plant_app/ui/screen/widget/custom_textfield.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        // we will wrap the column with SingleChildScrollView later
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/reset-password.png'),
              const Text('Forgot\nPassword', style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w700,
              ),),
              const SizedBox(
                height: 30,
              ),
              // we extract a customtextfield widget for reusability
              const CustomTextField(
                obscureText: false,
                hintText: 'Enter Email',
                icon: Icons.alternate_email,
              ),
              
              // let's create the signin button
              GestureDetector(
                // let's add onTap functionnality to the SignIn Button
                onTap: (){
                  
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColors,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text('Reset Password', style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),),
                  ),
                ),
              ),
              
              
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                // let's add an onTap functionality to the forgot password section
                onTap: (){
                  Navigator.pushReplacement(context, 
                  PageTransition(
                    child: const SignIn(), 
                    type: PageTransitionType.bottomToTop
                  ));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Have an Account? ',
                          style: TextStyle(
                            color: Constants.blackColors,
                        ),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Constants.primaryColors,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}