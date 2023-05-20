import 'package:get/get.dart';

/* This source was used to implement this animation
  https://youtu.be/a6IX3tj1wtk
*/

class FadeInAnimationController extends GetxController{
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}
