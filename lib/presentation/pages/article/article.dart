import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:module_app/presentation/controllers/controllers.dart';
import 'widget/card.widget.dart';

class ArticlePage extends StatelessWidget {
  final dioController = Get.find<DioController>();
  final httpController = Get.find<HttpController>();
  final getConnectController = Get.find<GetConnectController>();

  ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() {
            if (getConnectController.isLoading.value) {
              // Display a progress indicator while loading
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
                ),
              );
            } else {
              // Display the list of articles
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: getConnectController.articles.length,
                  itemBuilder: (context, index) {
                    var article = getConnectController.articles[index];
                    return CardArticle(article: article);
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
