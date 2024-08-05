import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Constants.dart';
import 'package:plant_app/ui/root_page.dart';
import 'package:plant_app/ui/screen/forgot_password.dart';
import 'package:plant_app/ui/screen/signup_page.dart';
import 'package:plant_app/ui/screen/widget/custom_textfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
              Image.asset('assets/images/signin.png'),
              const Text('Sign In', style: TextStyle(
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
              const CustomTextField(
                obscureText: true,
                hintText: 'Enter Password',
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 10,
              ),
              // let's create the signin button
              GestureDetector(
                // let's add onTap functionnality to the SignIn Button
                onTap: (){
                  Navigator.pushReplacement(context, PageTransition(
                    child: const RootPage(), 
                    type: PageTransitionType.bottomToTop));
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColors,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text('Sign In', style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // let's create the forgot password section
              GestureDetector(
                // let's add an onTap functionality to the forgot password section
                onTap: (){
                  Navigator.pushReplacement(context, 
                  PageTransition(
                    child: const ForgotPassword(), 
                    type: PageTransitionType.bottomToTop
                  ));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Forgot Password? ',
                          style: TextStyle(
                            color: Constants.blackColors,
                        ),
                        ),
                        TextSpan(
                          text: 'Reset here',
                          style: TextStyle(
                            color: Constants.primaryColors,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('QR'),
                  ),
                  Expanded(child: Divider(),),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // let's create the Sign In with Google Button
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.primaryColors),
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/images/google.png'),
                    ),
                    Text('Sign In with Google', style: TextStyle(
                      color: Constants.blackColors,
                      fontSize: 18.0
                    ),),
                  ],
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
                    child: const SignUp(), 
                    type: PageTransitionType.bottomToTop
                  ));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'New to planty? ',
                          style: TextStyle(
                            color: Constants.blackColors,
                        ),
                        ),
                        TextSpan(
                          text: 'Register',
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

