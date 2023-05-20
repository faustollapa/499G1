import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tales_of_tourists/services/auth/auth_exceptions.dart';
import 'package:tales_of_tourists/services/auth/auth_google.dart';
import 'package:tales_of_tourists/services/auth/auth_service.dart';
import 'package:tales_of_tourists/utilities/show_error_dialog.dart';
import 'package:tales_of_tourists/widgets/form_header_widget.dart';
import 'login_view.dart';
import 'verify_email_view.dart';

/* This the source that I used to implement the user authentication part of this signup file.
  https://youtu.be/VPvVD8t02U8 from 7:31:31 - 14:16:21
*/

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  // Created variables to signup
  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _phonenumber;
  late final TextEditingController _charity;

  @override
  void initState() {
    _username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _phonenumber = TextEditingController();
    _charity = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _phonenumber.dispose();
    _charity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFA1C7B6),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              // The Tales of Tourists logo and text
              children: [
                const FormHeaderWidget(
                  image: 'img/LOGO.png', 
                  title: 'Start your journey', 
                  subTitle: 'Sign up to complete quests',
                  imageHeight: 0.15,
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      /*
                        Text field forms for username, email, password, phone number, charity and its components.
                      */
                      children: [
                        TextFormField( 
                          controller: _username,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            label: Text('Username'),         
                            prefixIcon: Icon(Icons.person_2_outlined),
                            hintText: 'Enter your username here',
                            border: OutlineInputBorder()
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _email,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            label: Text('Email'),           
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: 'Enter your email here',
                            border: OutlineInputBorder()
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _phonenumber,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            label: Text('Phone number'),
                            prefixIcon: Icon(Icons.numbers_outlined),
                            hintText: 'Enter your phone number here',
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
                            label: Text('Password'),
                            prefixIcon: Icon(Icons.fingerprint_outlined),
                            hintText: 'Enter your password here',
                            border: OutlineInputBorder()
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _charity,
                          enableSuggestions: false,
                          autocorrect: true,
                          decoration: const InputDecoration(
                            label: Text('Charity'),
                            prefixIcon: Icon(Icons.local_hospital),
                            hintText: 'Enter your charity of choice here',
                            border: OutlineInputBorder()
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        /*
                          This is the content for the signup button upon pressing it. Upon pressing it, it will
                          create a user with email and password. There could be errors caught which is what follows
                          in order to catch any errors. If successful, it sends an email to verify email and 
                          goes to the verify email page.
                        */
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final email = _email.text;
                              final password = _password.text;
                              try {
                                await AuthService.firebase().createUser(
                                  email: email, 
                                  password: password
                                );
                                AuthService.firebase().sendEmailVerification();
                                Get.to(() => const VerifyEmailView());
                              } on WeakPasswordAuthException {
                                await showErrorDialog(
                                  context, 
                                  'Weak password',
                                );
                              } on EmailAlreadyInUseAuthException {
                                await showErrorDialog(
                                  context, 
                                  'Email is already in use',
                                );
                              } on InvalidEmailAuthException {
                                await showErrorDialog(
                                  context, 
                                  'This is an invalid email',
                                );
                              } on GenericAuthException {
                                await showErrorDialog(
                                  context, 
                                  'Failed to register',
                                );
                              }
                            },
                            child: Text('Sign up'.toUpperCase()),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Column(
                          /*
                            This is to display the Google login button and upon pressing it calls the class 
                            from the auth_google.dart file.
                          */
                          children: [
                            const Text('OR'),
                            const SizedBox(height: 15.0),
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
                            // This is the button to take to login page, if the user wants to login instead.
                            TextButton(
                              onPressed: () {
                                Get.to(() => const LoginView());
                              }, 
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Already Have an account? ', 
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const TextSpan(text: 'Login'),
                                  ]
                                )
                              ),
                            )
                          ],
                        ),
                      ]
                    )
                  ),
              ],
            ),
          )
        )
      )
    );
  }
}
