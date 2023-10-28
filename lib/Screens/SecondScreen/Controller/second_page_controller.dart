import 'package:get/get.dart';

class SecondPageController extends GetxController {
  var count = 0;

  increment() {
    count++;
    update(['txtCount']); // only update for txtCount Id GetxBuilder
  }
}
