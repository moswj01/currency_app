import 'dart:async';
import 'dart:io';

import 'package:currency_app/app/modules/home/models/currency_model.dart';
import 'package:currency_app/app/modules/home/service/get_currency.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  CurrencyModel? currencyModel;
  var isLoad = true.obs;
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    getCurrency();
    Timer.periodic(Duration(minutes: 1), (timer) {
      getCurrency();
    });
    super.onInit();
  }

  void getCurrency() {
    update();
    ApiService.getCurrency().then((value) async {
      currencyModel = value;
      currencyModel == null ? isLoad.value = true : isLoad.value = false;
      final rootFile = await rootBundle.load("assets/history.json");
      rootFile.buffer;
      File file = File("assets/history.json");
      print(file);
      RandomAccessFile ref = file.openSync(mode: FileMode.append);
      ref.writeStringSync(value.toString());
    });
    update();
  }

  @override
  void onReady() {
    getCurrency();
    Timer.periodic(Duration(minutes: 1), (timer) {
      getCurrency();
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
