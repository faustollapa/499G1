import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tales_of_tourists/services/auth/auth_service.dart';
import 'package:tales_of_tourists/widgets/form_header_widget.dart';
import 'login_view.dart';

/* This the source that I used to implement the user authentication part of this verify email file.
    - https://youtu.be/VPvVD8t02U8 from 7:31:31 - 14:16:21

   As for the frontend part of this file, I got my knowledge from 
    - https://youtu.be/TrXU0Q5-jMs
*/

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFA1C7B6),
      appBar: AppBar(
        title: const Text ('Verify Email'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
          children: [
            const SizedBox(height: 120),
                const FormHeaderWidget(
                  image: 'img/email.png', 
                  title: 'E-mail Verification', 
                  subTitle: 'Verify your email',
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
          const Text(
            "We've sent you an email verification. Please open it to verify your account."),
          const Text(
            "If you haven't recieved a verification email yet, press the button below"),
          TextButton(
            onPressed: () async { 
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text('Send email verification'),
          ),
          const SizedBox(height: 20.0),
          const Text(
            "Once you have verified your email, press the button below to login"),
            const SizedBox(height: 20.0),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              Get.to(() => const LoginView());
            }, 
            child: const Text('Go back to log in'),
          )
        ],
      ),
    )
    )
    )
    );
  }
}
