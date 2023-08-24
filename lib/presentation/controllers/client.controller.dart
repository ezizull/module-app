import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  Client client = Client();

  @override
  void onInit() {
    super.onInit();

    // appwrite
    const endPoint = "ENDPOINT_APPWRITE";
    const project = "PROJECT_APPWRITE";

    client.setEndpoint(endPoint).setProject(project).setSelfSigned(status: true);
  }
}
