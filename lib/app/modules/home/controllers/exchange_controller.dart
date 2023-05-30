import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangeController extends GetxController {
  final List<String> items = ['USD', 'EUR', 'GBP'];
  final selectedItem = 'USD'.obs;
  final result = 0.0.obs;
  TextEditingController btc = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }
}
