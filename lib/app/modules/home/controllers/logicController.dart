import 'package:get/get.dart';

class LogicController extends GetxController {
  var validateLength = "".obs;
  var validateDuplicate = "".obs;
  var validateLinedUp = "".obs;
  var validateDuplicate2 = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  validator(value) {
    if (value.length > 6) {
      validateLength.value = "ความยาวมากกว่า 6 ตัวอักษร";
    }
    for (int i = 1; i < value.length; i++) {
      print(value[i]);
      if (value[i] == value[i - 1] && value[i] == value[i - 1]) {
        validateDuplicate.value = "ตัวเลขในอินพุตมีเลขซ้ำติดกันเกิน 2 ตัว";
      } else {
        validateDuplicate.value = "";
      }
    }
  }
}
