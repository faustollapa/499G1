import 'package:flutter/material.dart';
import 'package:tales_of_tourists/views/tourist_of_week.dart';

const Color avatarbackground = Color(0xFF2FCB72);
const Color avatarbackground1 = Color.fromARGB(255, 0, 0, 0);
const Color profcard = Color(0xFF196F3D);
const Color grade1 = Color.fromARGB(255, 128, 30, 203);
const Color grade2 = Color(0xFF96c93d);
const Color cool = Color(0xFFA1C7B6); //big color behind trophy
const clickedColor = Color(0xFF0C3329);
const unclickedColor = Color(0xFF196F3D);
Color probtn =  const Color(0xFFA1C7B6); //table
Color leadbtn = const Color.fromARGB(255, 248, 247, 249);
Color gold = const Color(0xFFD0B13E);
Color silver = const Color(0x80808080);
Color bronze = const Color(0xFFA45735);

/* Oscar - For the following file I have used code from a youtube video/github/post:


 - https://www.geeksforgeeks.org/flutter-navigating-through-gesture-on-images/# 
 - https://blog.logrocket.com/handling-gestures-flutter-gesturedetector/


 The above was to help for clicking on the top user, to take you to a different page.
  
  Fausto - This is the source used to implement the leaderboard page

    - https://github.com/m0hit-kumar/Flutter-UI/blob/main/leaderBoard.dart
*/

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({super.key});

  @override
  State<StatefulWidget> createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends State<LeaderboardView> {
  List<String> names = [
    "user1", "user2", "user3"
  ];

  List<String> items = [
    "1", "2", "3"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: cool,
          child: Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 6.0,
            ),
            elevation: 0,
            color: const Color.fromARGB(255, 246, 245, 246),//user 5
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "7",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  CircleAvatar(
                    foregroundColor: Colors.green,
                  ),
                  Text(
                    "user5",
                    style: TextStyle(
                      color:Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "30",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )
            ),
          ),
        ),
      ),
      body: CustomScrollView(
       slivers: <Widget>[
        SliverAppBar(
          backgroundColor: probtn,
          pinned: true,
          snap: false,
          floating: false,
          expandedHeight: 200.0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color:avatarbackground1,
              height: 50,
              child: Row(
                children: [
                  const SizedBox(width: 35),
                  Text(
                    "Position",
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold
                    )
                  ),
                  const SizedBox(width: 52),
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 60),
                  Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 60),
                  Text(
                    "Score",
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[leadbtn.withOpacity(0.5), cool]
                )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Text(
                      "Leaderboard",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Icon(
                    Icons.emoji_events_rounded,
                    color: gold,
                    size: 70,
                  ),
                ],
              ),
            ),
          ),
          elevation: 9.0,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => buildList(context, index),
            childCount: items.length,
          )
        )
       ], 
      )
    );
  }
  Widget buildList(BuildContext txt, int index) {
    int ind = index + 1;
    final pos = items[index];
    final name = names[index];

    Widget listItem;

    if(ind == 1) {
      listItem = GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const TopUserPage(topUser: "User1")));
        },
        child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0, vertical: 6.0
        ),
        shadowColor: Colors.grey[200],
        color: gold,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pos,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                )
              ),
              const CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Text(
                "100",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          )
        )
        )
      );
    }
    else if(ind == 2) {
      listItem = Card(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shadowColor: Colors.grey[200],
        color: silver,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pos,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                )
              ),
              const CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Text(
                "75",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                )
              )
            ],
          )
        )
      );
    }
    else if(ind == 3) {
      listItem = Card(
        shadowColor: Colors.grey,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        color: bronze,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pos,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              const CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Text(
                "55",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                )
              )
            ],
          ),
        )
      );
    }
    else {
      listItem = Card(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shadowColor: Colors.grey[200],
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pos,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              const CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight:FontWeight.bold
                ),
              ),
              const Text(
                "Score",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      );
    }
    return Stack(
      children: [
        Container(
          color: Colors.grey[200],
          child: listItem,
        ),
      ],
    );
  }
}
