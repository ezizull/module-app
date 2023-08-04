// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                onPressed: () => Get.toNamed("/second"),
                child: const Text("Get.put"),
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () => Get.toNamed("/third"),
                child: const Text("Get.lazyPut"),
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () => Get.toNamed("/fourth"),
                child: const Text("Get.putAsync"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
