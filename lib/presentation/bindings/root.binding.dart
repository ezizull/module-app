import 'package:get/get.dart';

import 'package:module_app/presentation/controllers/controllers.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClientController());
  }
}
