import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final storage = GetStorage("GetService");

  final inputControl = TextEditingController();

  RxString message = ''.obs;

  Future<StorageService> init() async {
    await GetStorage.init("GetService");
    await writeStorage("GetService", "Welcome to GetService");

    message.value = await readStorage("GetService");

    storage.listenKey("GetService", (value) {
      message.value = value;
      print("StorageService:: ${message.value}");
    });

    return this;
  }

  readStorage(String key) {
    return storage.read(key);
  }

  writeStorage(String key, dynamic value) {
    return storage.write(key, value);
  }
}
