import 'package:get/get.dart';

class LazyCountController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    count.value++;
    print("LazyCountController:: onInit ${count.value}");
  }

  @override
  void onReady() {
    super.onReady();
    count.value++;
    print("LazyCountController:: onReady ${count.value}");
  }

  @override
  void onClose() {
    super.onClose();
    count.value--;
    print("LazyCountController:: onClose ${count.value}");
  }

  void increment() {
    count.value++;
    print("LazyCountController:: increment ${count.value}");
    update();
  }
}
