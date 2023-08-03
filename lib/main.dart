import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:module_app/presentation/routes/routes.dart';
import 'package:module_app/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Main(initialRoute: '/'));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main({required this.initialRoute, super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      unknownRoute: GetPages.notFound,
      getPages: GetPages.routers,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      translationsKeys: AppTranslation.translations,
      locale: const Locale('en', 'EN'),
    );
  }
}
