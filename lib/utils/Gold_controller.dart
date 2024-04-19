import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/Gold_model.dart';

class GoldController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Gold> goldList = <Gold>[].obs;
  RxBool notFound = false.obs;
  late Timer _timer;
  bool initialFetchCompleted = false;

  @override
  onInit() {
    super.onInit();
    fetchGold();
    _startTimer();
  }


  void _startTimer() {
    const Duration updateInterval = Duration(minutes: 1);
    _timer = Timer.periodic(updateInterval, (_) {
      fetchGold();
    });
  }


  void _cancelTimer() {
    _timer.cancel();
  }

  @override
  void onClose() {
    _cancelTimer();
    super.onClose();
  }

  fetchGold() async {
    try {
      if (!initialFetchCompleted) {
        isLoading(true);
      }
      var response =
      await http.get(Uri.parse('http://146.19.212.233:8000/gold_and_coins/'));
      if (response.statusCode == 200) {
        final decodedResponse = utf8.decode(response.bodyBytes);
        List<Gold> exchanges = goldFromJson(decodedResponse);
        goldList.assignAll(exchanges);
        if (!initialFetchCompleted) {
          initialFetchCompleted = true;
          isLoading(false);
        }
      } else if (response.statusCode == 404) {
        notFound(true);
      }
    } catch (e) {
      print(e);
      // Handle exception
    }
  }
}
