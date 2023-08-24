import 'package:appwrite/appwrite.dart';

import 'client.controller.dart';

class StorageController extends ClientController {
  Storage? databases;

  @override
  void onInit() {
    super.onInit();

    // appwrite
    databases = Storage(client);
  }
}
