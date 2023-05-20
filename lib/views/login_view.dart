import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tales_of_tourists/constants/routes.dart';
import 'package:tales_of_tourists/services/auth/auth_exceptions.dart';
import 'package:tales_of_tourists/services/auth/auth_google.dart';
import 'package:tales_of_tourists/services/auth/auth_service.dart';
import 'package:tales_of_tourists/utilities/show_error_dialog.dart';
import 'package:tales_of_tourists/views/register_view.dart';
import 'package:tales_of_tourists/widgets/form_header_widget.dart';

/* This the source that I used to implement the user authentication part of this login file.
    - https://youtu.be/VPvVD8t02U8 from 7:31:31 - 14:16:21
    
   As for the frontend part of this file, I got my knowledge from 
    - https://youtu.be/TrXU0Q5-jMs
*/

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Created variables to login
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:const Color(0xFFA1C7B6),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              // The Tales of Tourists logo and text
              const FormHeaderWidget(
                  image: 'img/LOGO.png', 
                  title: 'Welcome back traveler', 
                  subTitle: 'Continue on completing quests to become the best tourist'
              ),
              Form(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Text field forms for email, password and its components
                    children: [
                      TextFormField(
                        controller: _email,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          labelText: 'Email',
                          hintText: 'Enter your email here',
                          border: OutlineInputBorder()
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.fingerprint),
                          labelText: 'Password',
                          hintText: 'Enter your password here',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: null, 
                            icon: Icon(Icons.remove_red_eye_outlined),
                          )
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // Forgot Password button is there for display
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {}, 
                          child: const Text('Forgot Password?'),
                        ),
                      ),
                      /*
                        This is the content for the login button where upon pressing it, it will
                        try to login with the email and password. If there is an error, then one of the 
                        exceptions will be called and display an error message. If there is a user and 
                        they are verified then it goes to the quest selection page and if there is a user 
                        but not verified, then it goes to the verify email page.
                      */
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            final email = _email.text;
                            final password = _password.text;
                            try {
                              await AuthService.firebase().logIn(
                                email: email,
                                password: password,
                              );
                              final user = AuthService.firebase().currentUser;
                              if(user?.isEmailVerified ?? false) {
                              // User's email is verified             
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                roothomeRoute, 
                                (route) => false,
                                );

                              } else {
                              // User's email is not verified
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                verifyEmailRoute, 
                                (route) => false,
                                );
                              }
                            } on UserNotFoundAuthException {
                              await showErrorDialog(
                                context, 
                                'User not found'
                              );
                            } on WrongPasswordAuthException {
                              await showErrorDialog(
                                context, 
                                'Wrong credentials',
                              );
                            } on GenericAuthException {
                              await showErrorDialog(
                                context, 
                                'Authentication error',
                              );
                            }
                          }, 
                          child: Text('Login'.toUpperCase()),
                        ),
                      ),
                      const SizedBox(height : 10.0),
                      /* 
                        This is to display the Google login button and upon pressing it calls the class 
                        from the auth_google.dart file.
                      */
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('OR'),
                          const SizedBox(height: 10.0),
                          GestureDetector(
                            onTap: () => GoogleAuthService().signInWithGoogle(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset('img/google.png', width: 20),
                                const SizedBox(width: 10),
                                const Text('Sign in with Google'),
                              ],
                            )
                          ),
                          const SizedBox(height: 20.0,),
                          // This is the button to take to signup page, if the user wants to signup instead.
                          TextButton(
                            onPressed: () {
                              Get.to(() => const RegisterView());
                            }, 
                            child: Text.rich(
                              TextSpan(
                                text: 'Don\'t have an account? ',
                                style: Theme.of(context).textTheme.bodyLarge,
                                children: const [
                                  TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ]
                              )
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
          )
        ),
      )
    );
  }
}
