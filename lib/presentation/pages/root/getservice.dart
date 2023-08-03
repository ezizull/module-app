// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/services/services.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

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
            Text("Root Page", style: TextStyle(fontSize: 30)),
            Obx(
              () => Text(
                "${service.message.obs}",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: service.inputControl,
                onChanged: (value) {
                  service.writeStorage("GetService", value);
                },
                decoration: InputDecoration(
                  label: Text('Realtime Storage'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
