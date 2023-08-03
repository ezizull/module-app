import 'package:get/get.dart';

class CountController extends GetxController {
  final count = 0.obs;

  Future<CountController> init() async {
    const duration = Duration(seconds: 5);

    Future.delayed(duration, () => count.value++);
    print("CountController:: Future init ${count.value}");

    return this;
  }

  @override
  void onInit() {
    super.onInit();
    count.value++;
    print("CountController:: onInit ${count.value}");
  }

  @override
  void onReady() {
    super.onReady();
    count.value++;
    print("CountController:: onReady ${count.value}");
  }

  @override
  void onClose() {
    super.onClose();
    count.value--;
    print("CountController:: onClose ${count.value}");
  }

  void increment() {
    count.value++;
    print("CountController:: increment ${count.value}");
    update();
  }
}
