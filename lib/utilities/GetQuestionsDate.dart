import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetQuestionDate extends GetxController {
  int indexOpen = 0;
  Future<List> getDate() async {
    var url = Uri.parse('https://testapi.huffazulmutoon.com/api/faq');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        print(response.body);
        return jsonDecode(response.body);
      } catch (e) {
        Get.snackbar('error', e.toString());
      }
    }
    return [];
  }

  void indexChange(int n){
    indexOpen = n;
    update();
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
