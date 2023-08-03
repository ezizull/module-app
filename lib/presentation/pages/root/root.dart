import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/pages/second/second.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Root Page", style: TextStyle(fontSize: 30)),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () => Get.to(const SecondPage()),
                child: const Text("Get.to"),
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () => Get.toNamed('second'),
                child: const Text("Get.toNamed"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
