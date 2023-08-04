import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:module_app/presentation/controllers/controllers.dart';
import 'package:module_app/presentation/services/services.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final controller = Get.find<CountController>();
  final service = Get.find<StorageService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "${service.message.value.capitalize} Page",
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Obx(
              () => Text(
                "${controller.count.obs}",
                style: const TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () => controller.increment(),
                child: const Text("increment"),
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text("Get.back"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
