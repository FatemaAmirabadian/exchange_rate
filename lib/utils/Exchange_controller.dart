import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/Exchange_model.dart';

class ExchangeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Exchange> exchangesList = <Exchange>[].obs;
  RxBool notFound = false.obs;
  RxBool notConnected = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchExchanges();
  }

  fetchExchanges() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('http://146.19.212.233:8000/currencies/'));
      if (response.statusCode == 200) {
        final decodedResponse = utf8.decode(response.bodyBytes);
        List<Exchange> exchanges = exchangeFromJson(decodedResponse);
        exchangesList.assignAll(exchanges);
      } else if (response.statusCode == 404) {
        notFound(true);
      }
    }catch (e) {
      print(e);
      // Handle exception
    } finally {
      isLoading(false);
    }
  }
}
