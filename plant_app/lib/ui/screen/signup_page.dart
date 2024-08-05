import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Constants.dart';
import 'package:plant_app/ui/screen/Signin_page.dart';
import 'package:plant_app/ui/screen/widget/custom_textfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
              Image.asset('assets/images/signup.png'),
              const Text('Sign Up', style: TextStyle(
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
                obscureText: false,
                hintText: 'Enter Full Name',
                icon: Icons.person,
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
                  
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColors,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text('Sign Up', style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700
                    ),),
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
                    Text('Sign Up with Google', style: TextStyle(
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