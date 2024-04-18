import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/Gold_model.dart';

class GoldController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Gold> goldList = <Gold>[].obs;
  RxBool notFound = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchGold();
  }

  fetchGold() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('http://146.19.212.233:8000/gold_and_coins/'));
      if (response.statusCode == 200) {
        final decodedResponse = utf8.decode(response.bodyBytes);
        List<Gold> exchanges = goldFromJson(decodedResponse);
        goldList.assignAll(exchanges);
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
