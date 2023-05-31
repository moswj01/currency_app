import 'package:currency_app/app/modules/home/controllers/logicController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class LogicView extends GetView<HomeController> {
  LogicView({Key? key}) : super(key: key);
  final logicController = Get.put(LogicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logic Test"),
        backgroundColor: Color(0xFF25262F),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 100),
                child: TextFormField(
                  onChanged: (value) {
                    logicController.validator(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Input Number',
                  ),
                ),
              ),
            ),
            Obx(() => Text(
                  logicController.validateLength.value,
                  style: GoogleFonts.prompt(
                      fontSize: 18, color: Color(0xFF00964E)),
                )),
            Obx(() => Text(
                  logicController.validateDuplicate.value,
                  style: GoogleFonts.prompt(
                      fontSize: 18, color: Color(0xFF00964E)),
                )),
            Obx(() => Text(
                  logicController.validateLinedUp.value,
                  style: GoogleFonts.prompt(
                      fontSize: 18, color: Color(0xFF00964E)),
                )),
            Obx(() => Text(
                  logicController.validateDuplicate2.value,
                  style: GoogleFonts.prompt(
                      fontSize: 18, color: Color(0xFF00964E)),
                )),
          ],
        ),
      ),
    );
  }
}
