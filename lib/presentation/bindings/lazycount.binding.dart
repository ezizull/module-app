import 'package:get/get.dart';

import 'package:module_app/presentation/controllers/controllers.dart';

class LazyCountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LazyCountController());
  }
}
