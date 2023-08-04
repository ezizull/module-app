import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:module_app/presentation/services/services.dart';

class SessionMiddleware extends GetMiddleware {
  StorageService storageService = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    storageService.message.refresh();
    if (!storageService.message.contains("user")) return const RouteSettings(name: "/");
    return null;
  }
}
