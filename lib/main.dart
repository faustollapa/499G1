import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tales_of_tourists/constants/routes.dart';
import 'package:tales_of_tourists/services/auth/auth_service.dart';
import 'package:tales_of_tourists/views/login_view.dart';
import 'package:tales_of_tourists/views/quest_selection.dart';
import 'package:tales_of_tourists/views/register_view.dart';
import 'package:tales_of_tourists/views/main_page.dart';
import 'package:tales_of_tourists/views/set_photo_screen.dart';
import 'package:tales_of_tourists/views/user_profile_view.dart';
import 'package:tales_of_tourists/views/verify_email_view.dart';
import 'package:tales_of_tourists/views/welcome_view.dart';
import 'package:tales_of_tourists/widgets/theme.dart';

/* Main function that runs the file 
  This the source that I used to implement the main file.
  https://youtu.be/VPvVD8t02U8 from 7:31:31 - 14:16:21
  I made changes to the frontend when running the app such as the parameters under GetMaterialApp
*/
void main() 
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const HomePage(), // Runs HomePage
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        questhomeRoute:(context) => const TOTHomeView(),
        verifyEmailRoute:(context) => const VerifyEmailView(),
        userProfileRoute:(context) => const UserProfileView(),
        roothomeRoute:(context) => const MainPage(),
        setPhotoScreenRoute:(context) => const SetPhotoScreen(),
      },
    ),
  );
}

/*
  Initializes Firebase, connects. If it cannot connect because of bad wifi/cell service then it will
  display a circular progress indicator. If able to connect, it checks if a user is currently logged in,
  if so then it will check if the user is verified. If the user is not verified, it will go the verify
  email page. If a user is logged in and verified, then it opens the quest selection page. If no user
  is logged in then it goes to the welcome page.
*/
class HomePage extends StatelessWidget 
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder:(context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthService.firebase().currentUser;
              if(user != null) {
                if(user.isEmailVerified) {
                  return const MainPage();
                } else {
                  return const VerifyEmailView();
                }
              } else {
                return const WelcomeScreen();
              }
            default: 
              return const CircularProgressIndicator();
        }
      },
    );
  }
}
