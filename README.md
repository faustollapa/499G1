# Tales of Tourists

Build Instructions for Tales of Tourists - Frontend

Note: This document is for building from a Mac OS machine. Not deployed.

Important First Steps

You must have xCode installed on your Mac, along with the iOS Simulator.
You should test by opening the simulator to make sure it is working before running the project.
We used VSCode to code, and run the project. However, any IDE should work.
On VSCode, navigate to extensions and install : Flutter (Dart-Code.flutter), and Dart (Dart-Code.dart-code). These extensions will have an official blue tick checkmark.

Installing flutter

Our application uses the Flutter framework (https://docs.flutter.dev/get-started/install/macos).

We highly recommend using the following youtube guide to install on a Mac machine: https://youtu.be/gltfWmmzG5c (0:00 - 6:25 MUST WATCH)

Once flutter is installed, running the following command in terminal will allow you to check if it is installed correctly:
Flutter doctor - highlights any missing packages, for android warnings you can ignore them.
Close terminal fully, re-open and run flutter doctor. If it does not work, flutter was not installed correctly, follow the video extremely carefully!


Downloading Github Files

A link to our Github Repository that will allow you to download the files can be found here: https://github.com/faustollapa/499G1

Click on the Code drop down menu > SSH > Download zip.

From this point, remember where you store the project folder. (Desktop works fine, anywhere will do)

Running the Project

Open VSCode, and open the folder that holds the project. Command + O , in the VSCode homepage.

Navigate to your pubspec.yaml file, it will ask you to run ‘pub get’. Click run, and it will download all packages/dependencies needed to run the project. (If it does not, continue to the next step anyway)

Open terminal on mac, and open up the iOS simulator application. On terminal, do the following: 
Cd to the location of the project folder.
Cd to the folder name, (for example: cd Tales)
Make sure you are in the folder, then use: flutter run. 
This will begin compiling, and xCode compilation. It WILL take some time.
 ALSO It will run ‘pub get’ automatically if you didn't do step 2.
Once done, the Simulator app should automatically open the Tales of Tourist App. From there, you can now interact and navigate the entire application.


