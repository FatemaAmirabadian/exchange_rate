import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/Exchange_model.dart';

class ExchangeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Exchange> exchangesList = <Exchange>[].obs;

  @override
  onInit() {
    super.onInit();
    fetchExchanges();
  }

  fetchExchanges() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('http://146.19.212.233:8000/currencies/'));
      final decodedResponse = utf8.decode(response.bodyBytes);
      List<Exchange> exchanges = exchangeFromJson(decodedResponse);
      exchangesList.value = exchanges;
    } finally {
      isLoading(false);
    }
  }
}