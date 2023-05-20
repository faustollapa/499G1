import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tales_of_tourists/constants/color.dart';
import 'package:tales_of_tourists/views/register_view.dart';
import 'package:tales_of_tourists/widgets/fade_in_animation/animation_controller.dart';
import 'package:tales_of_tourists/widgets/fade_in_animation/animation_design.dart';
import 'package:tales_of_tourists/widgets/fade_in_animation/animation_model.dart';
import 'login_view.dart';

/*
  Starts the animation to bring in the welcome screen into view. An animation image is shown
  along with the title, text, and two buttons for login and signup.

  I got my knowledge from 
    - https://youtu.be/TrXU0Q5-jMs
*/

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : const Color(0xFFA1C7B6),
      body: Stack(
        children: [
          FadeInAnimation(
            durationInMs: 1200,
            animate: AnimatePosition(
              bottomAfter: 0, 
              bottomBefore: -100, 
              leftBefore: 0, 
              leftAfter: 0, 
              topBefore: 0, 
              topAfter: 0, 
              rightAfter: 0, 
              rightBefore: 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Lottie.network('https://assets10.lottiefiles.com/packages/lf20_ayk6t8xd.json', height: 500),
                  Column(
                    children: [
                      Text(
                        'Welcome to Tales of Tourists', 
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'Get ready to embark on quests to explore what New York City has to offer.', 
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row (
                    children: [
                      Expanded(
                        child: OutlinedButton (
                          onPressed: () => Get.to(() => const RegisterView()), 
                        child: Text("Signup".toUpperCase())
                        )
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const LoginView()), 
                          
                        child: Text('Login'.toUpperCase())
                        )
                      ),
                    ],
                  )
                ],
              )
            ),
          ),
        ],
      )
    );
  }
}
