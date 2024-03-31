import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/Currency_model.dart';

class CurrencyController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Currency> currencyList = <Currency>[].obs;
  onInit() {
    super.onInit();
    fetchCurrencies();
  }

  fetchCurrencies() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(
          "http://146.19.212.233:8000/currencies/"));
      List<Currency> currencies = currencyFromJson(response.body);
      currencyList.value = currencies;
    } finally {
      isLoading(false);
    }
  }
}