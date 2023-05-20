import 'package:flutter/material.dart';


/* For the following files I have used code from a youtube video/github/post
  THis was the very last page we worked on, no documentation.
*/

class TopUserPage extends StatefulWidget {
  final String topUser;

  const TopUserPage({Key? key, required this.topUser}) : super(key: key);

  @override
  _TopUserPageState createState() => _TopUserPageState();
}

class _TopUserPageState extends State<TopUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA1C7B6),
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        elevation: 0.0,
        title: const Text('Quest Selection'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
          color: const Color(0xFFA1C7B6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 200,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.black,
              ),
              child: const Text(
                'Score: 100 points',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.black,
              ),
              child: Text(
                'Congratulations, ${widget.topUser}! You are the Tourist of The Week!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.black,
              ),
              child: Column(
                children: const [
                  Text(
                    'Charity: St. Judes',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Amount raised: \$500.00',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Set the background color
                foregroundColor: Colors.white, // Set the text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Back to LeaderBoardView'),
            ),
          ],
        ),
      ),
    );
  }
}
