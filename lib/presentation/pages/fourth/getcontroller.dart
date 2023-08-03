import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/controllers.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  CountController controller = CountController();

  @override
  initState() {
    super.initState();
    asyncFunc();
  }

  void asyncFunc() async {
    controller = await Get.putAsync(() => CountController().init());
    print("FourthPage:: $controller");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Fourth Page", style: TextStyle(fontSize: 30)),
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
