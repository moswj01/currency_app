import 'package:currency_app/app/modules/home/controllers/exchange_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final exchangeController = Get.put(ExchangeController());
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF25262F),
        title: Text("BTC"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history))],
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF25262F),
          ),
          child: Obx(() => homeController.isLoad.value == false
              ? Column(
                  children: [
                    Container(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Text(
                          homeController.currencyModel!.disclaimer,
                          style: GoogleFonts.prompt(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Last Update",
                            style: GoogleFonts.prompt(
                                fontSize: 18, color: Color(0xFF383838)),
                          ),
                          Text(
                            DateFormat().format(homeController
                                .currencyModel!.time.updatedIso
                                .toLocal()),
                            style: GoogleFonts.prompt(
                                fontSize: 18, color: Color(0xFF383838)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFF2C2D35).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Image.asset("assets/dollar.png", width: 30),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homeController.currencyModel!.bpi.usd.code,
                              style: GoogleFonts.prompt(color: Colors.white),
                            ),
                            Text(
                              homeController.currencyModel!.bpi.usd.rate,
                              style: GoogleFonts.prompt(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFF2C2D35).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          "assets/euro.png",
                          width: 30,
                        ),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homeController.currencyModel!.bpi.eur.code,
                              style: GoogleFonts.prompt(color: Colors.white),
                            ),
                            Text(
                              homeController.currencyModel!.bpi.eur.rate,
                              style: GoogleFonts.prompt(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFF2C2D35).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Image.asset("assets/british.png", width: 40),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homeController.currencyModel!.bpi.gbp.code,
                              style: GoogleFonts.prompt(color: Colors.white),
                            ),
                            Text(
                              homeController.currencyModel!.bpi.gbp.rate,
                              style: GoogleFonts.prompt(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      child: Text(
                        "Exchange Calculator",
                        style: GoogleFonts.prompt(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 20.0),
                          Container(
                            width: 100,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text("- Select -"),
                                elevation: 0,
                                dropdownColor: Color(0xFF333238),
                                icon: Icon(Icons.keyboard_arrow_down_sharp),
                                value: exchangeController.selectedItem.value,
                                items: exchangeController.items
                                    .map((String value) =>
                                        DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: GoogleFonts.prompt(
                                                color: Colors.white),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (String? newValue) {
                                  exchangeController.selectedItem.value =
                                      newValue!;
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            child: Center(
                              child: TextFormField(
                               
                                style: GoogleFonts.prompt(
                                    color: Colors.white, fontSize: 18),
                                onChanged: (value) {
                                  if (exchangeController.selectedItem.value ==
                                      "USD") {
                                    exchangeController
                                        .result.value = homeController
                                            .currencyModel!.bpi.usd.rateFloat *
                                        int.parse(exchangeController.btc.text);
                                    print(exchangeController.btc.text);
                                    print(homeController
                                        .currencyModel!.bpi.usd.rateFloat);
                                  }
                                  if (exchangeController.selectedItem.value ==
                                      "EUR") {
                                    exchangeController
                                        .result.value = homeController
                                            .currencyModel!.bpi.eur.rateFloat *
                                        int.parse(exchangeController.btc.text);
                                    print(exchangeController.btc.text);
                                    print(homeController
                                        .currencyModel!.bpi.usd.rateFloat);
                                  }
                                  if (exchangeController.selectedItem.value ==
                                      "GBP") {
                                    exchangeController
                                        .result.value = homeController
                                            .currencyModel!.bpi.gbp.rateFloat *
                                        int.parse(exchangeController.btc.text);
                                    print(exchangeController.btc.text);
                                    print(homeController
                                        .currencyModel!.bpi.usd.rateFloat);
                                  }
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none, hintText: "BTC"),
                                autofocus: true,
                                controller: exchangeController.btc,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Obx(() => Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            "= ${NumberFormat().format(exchangeController.result.value)}",
                            style: GoogleFonts.prompt(
                                fontSize: 22, color: Colors.white),
                          ),
                        ))
                  ],
                )
              : Center(
                  child: Lottie.network(
                      "https://assets10.lottiefiles.com/packages/lf20_kxsd2ytq.json"),
                ))),
    );
  }
}
