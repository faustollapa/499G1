import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/* For the following files I have used code from a youtube video/github/post
  - https://github.com/JohannesMilke/image_picker_example
  - https://youtu.be/MSv38jO4EJk 
  - https://blog.logrocket.com/building-an-image-picker-in-flutter/ 

  I have seperated and re-organized the files
  in order to make the code have better readability.
*/

class ImagePickerApp extends StatefulWidget {
  const ImagePickerApp({Key? key}) : super(key: key);

  @override
  _ImagePickerAppState createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp> {
  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    final imageTemporary = File(image.path);

    setState(() {
      _image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload an image'),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          _image != null
              ? Image.file(_image!, width: 250, height: 250, fit: BoxFit.cover)
              : Image.network(
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.surveylegend.com%2Fuser-guide%2Ffile-upload%2F&psig=AOvVaw2NPwI6PqJ2eElzOXxqutmz&ust=1678832605685000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCJiMy_r42f0CFQAAAAAdAAAAABAE'),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            title: 'Upload photo',
            icon: Icons.image_outlined,
            onClick: () => getImage(ImageSource.camera),
          ),
        ]),
      ),
    );
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return SizedBox(
    width: 280,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 20,
          ),
          Text(title)
        ],
      ),
    ),
  );
}
