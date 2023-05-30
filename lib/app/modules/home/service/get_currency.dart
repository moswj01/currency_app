import 'package:currency_app/app/data/env.dart';
import 'package:currency_app/app/modules/home/models/currency_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  static Future<CurrencyModel> getCurrency() async {
    final dio = Dio();
    var response = await dio.get(BaseUrl.baseUrl);
    print(response);
    return currencyModelFromJson(response.data);
  }
}
