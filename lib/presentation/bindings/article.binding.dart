import 'package:get/get.dart';

import 'package:module_app/presentation/controllers/controllers.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HttpController());
    Get.put(DioController());
    Get.put(GetConnectController());
  }
}
