import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/controllers.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewController>(builder: (controller) {
      return Scaffold(
        body: SizedBox(
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Root Page",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "${controller.service.message.value.capitalize}",
                style: const TextStyle(fontSize: 30),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: controller.service.inputControl,
                  onChanged: (value) {
                    controller.service.writeStorage("GetService", value);
                  },
                  decoration: InputDecoration(
                    label: const Text('Realtime Storage'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Column(children: [
                  Text(
                    "${controller.count.obs}",
                    style: const TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () => controller.increment(),
                      child: const Text("increment"),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      );
    });
  }
}
