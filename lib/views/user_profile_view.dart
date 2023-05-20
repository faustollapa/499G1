import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tales_of_tourists/constants/color.dart';
import 'package:tales_of_tourists/views/update_user_profile.dart';

/*
  This has the animated profile image, with username. Under it is the button that takes you to the
  edit charity page. I called the function UserProfileItem that takes in a text and icon which 
  creates a box for each of the user's stats.

  I got my knowledge from 
    - https://youtu.be/TrXU0Q5-jMs
*/

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA1C7B6),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network('https://assets9.lottiefiles.com/packages/lf20_mr1kkmr2.json'),
              Text(
                '@username',
                style: GoogleFonts.lato(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
               SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, side: BorderSide.none, shape: const StadiumBorder()
                  ),
                  child: const Text('Change Charity', style: TextStyle(color: darkColor)),
                )
              ),
              const SizedBox(height: 30),
              const UserProfileItem(
                text: 'Points earned this week: 50', 
                icon: Icons.point_of_sale_outlined,
              ),
              const SizedBox(height: 40),
              const UserProfileItem(
                text: 'Total Points Earned: 200', 
                icon: Icons.point_of_sale,
              ),
              const SizedBox(height: 40),
              const UserProfileItem(
                text: 'Current Rank: 4', 
                icon: Icons.leaderboard,
              ),
              const SizedBox(height: 40),
              const UserProfileItem(
                text: 'Current Charity: St Judes', 
                icon: Icons.local_hospital,
              ),
            ],
          ),
        )
      ),
    );
  }
}

class UserProfileItem extends StatelessWidget {
  const UserProfileItem({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.zero,
      ),
      height: 50,
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Icon(
                  icon, 
                  size: 35, 
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),     
            ],
          ),
        ],
      ),
    );
  }
}
