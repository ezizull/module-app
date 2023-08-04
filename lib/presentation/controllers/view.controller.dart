import 'package:get/get.dart';

import 'package:module_app/presentation/services/services.dart';

class ViewController extends GetxController {
  final service = Get.find<StorageService>();

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    count.value++;
    print("ViewController:: onInit ${count.value}");
  }

  @override
  void onReady() {
    super.onReady();
    count.value++;
    print("ViewController:: onReady ${count.value}");
  }

  @override
  void onClose() {
    super.onClose();
    count.value--;
    print("ViewController:: onClose ${count.value}");
  }

  void increment() {
    count.value++;
    print("ViewController:: increment ${count.value}");
    update();
  }
}
