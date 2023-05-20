import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:tales_of_tourists/constants/color.dart';
import 'package:tales_of_tourists/views/main_page.dart';

/*
  I got my knowledge from 
    - https://youtu.be/TrXU0Q5-jMs
*/

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar that has a return angle button that goes back to the user profile page.
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
        title: Text('Edit Profile', style: Theme.of(context).textTheme.headlineMedium),
      ),
      // Has animation, text, text field and button.
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                 Lottie.network('https://assets9.lottiefiles.com/packages/lf20_mr1kkmr2.json'),
                ],
              ),
              const Text('Change your charity of choice.'),
                 const SizedBox(height: 5.0),
                 const Text('You can always change it back later'),
              const SizedBox(height: 30),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(label: Text('Charity'), prefixIcon: Icon(LineAwesomeIcons.hospital)),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const MainPage()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor, side: BorderSide.none, shape: const StadiumBorder()
                        ),
                        child: const Text('Change Charity', style: TextStyle(color: darkColor)),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}
