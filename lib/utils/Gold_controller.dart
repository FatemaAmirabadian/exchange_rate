import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/Gold_model.dart';

class GoldController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Gold> goldList = <Gold>[].obs;
//
  @override
  onInit() {
    super.onInit();
    fetchGold();
  }

  fetchGold() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('http://146.19.212.233:8000/gold-info/'));
      final decodedGoldResponse = utf8.decode(response.bodyBytes);
      List<Gold> golds = goldFromJson(decodedGoldResponse);
      goldList.assignAll(golds);
    } finally {
      isLoading(false);
    }
  }
}