import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tales_of_tourists/constants/routes.dart';
import 'package:tales_of_tourists/enums/menu_action.dart';
import 'package:tales_of_tourists/services/auth/auth_service.dart';
import 'package:tales_of_tourists/widgets/app_text_large.dart';


/* For the following files I have used code from a youtube video/github/post
  THis was the very first page we worked on, so a lot of flutter tutorials really helped:
  
  - https://www.javatpoint.com/flutter-stack
  - https://www.geeksforgeeks.org/flutter-appbar-widget/

*/

class TOTHomeView extends StatefulWidget {
  const TOTHomeView({Key? key}) : super(key: key);

  @override
  State<TOTHomeView> createState() => _TOTHomeViewState();
}

class _TOTHomeViewState extends State<TOTHomeView> {
  List<String> titles = [
    "Easy Quests",
    "Medium Quests",
    "Hard Quests",
  ];

  List<String> paragraphs = [
    "Easy Quests are the easiest ways to get points towards your ranking!\n \n Take a picture of the statue of liberty\n \n \n Visit the statue of liberty.",
    "Medium Quests are harder, but even more rewarding\n \n Take a friend to the statue of liverty (upload a photo) \n \n \n Take a picture at the top of the statue of liberty",
    "Hard Quests are the most challenging, with the biggest rewards!\n \n Take a selfie with a friend at the top of the statue of liberty while both wearing an I <3 NYC shirt \n \n \n Take a group photo with 3-5 people at the statue of liberty",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        elevation: 0.0,
        title: const Text('Quest Selection'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogOut = await showLogOutDialog(context);
                  if (shouldLogOut) {
                    await AuthService.firebase().logOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (_) => false,
                    );
                  }
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Logout'),
                )
              ];
            },
          )
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: titles.length,
            itemBuilder: (_, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,                
                decoration: const BoxDecoration(
                  color: Color(0xFFA1C7B6),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargeText(text: "Quests:"),
                        AppLargeText(text: titles[index], size: 28),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: paragraphs[index].split('\n').map((paragraph) {
                            if (paragraph.trim().isEmpty) {
                              return const SizedBox(height: 10);
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  paragraph,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 5,),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, setPhotoScreenRoute);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                                  ),
                                  child: const Text('Set Photo'),
                                ),
                                const SizedBox(height: 20,),
                              ],
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
  bottom: 20,
  right: 20,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Lottie.network(
        'https://assets2.lottiefiles.com/packages/lf20_4jKe3t.json',
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
      const SizedBox(width: 0.5),
      Lottie.network(
        'https://assets1.lottiefiles.com/packages/lf20_0QoXWYIV70.json',
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
    ],
  ),
),

        ],
      ),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Logout'),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}

               
