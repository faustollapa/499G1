import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tales_of_tourists/widgets/re_usable_select_photo_button.dart';

/* For the following files I have used code from a youtube video/github/post
  - https://github.com/JohannesMilke/image_picker_example
  - https://youtu.be/MSv38jO4EJk 
  - https://blog.logrocket.com/building-an-image-picker-in-flutter/ 

  I have seperated and re-organized the files
  in order to make the code have better readability.
*/


class SelectPhotoOptionsScreen extends StatelessWidget {
  final Function(ImageSource source) onTap;
  const SelectPhotoOptionsScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade300,
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'PHOTOS MUST BE LIVE',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectPhoto(
              onTap: () => onTap(ImageSource.camera),
              icon: Icons.camera_alt_outlined,
              textLabel: 'Use a Camera',
            ),
          ])
        ],
      ),
    );
  }
}
