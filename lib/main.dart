import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:module_app/presentation/bindings/bindings.dart';
import 'package:module_app/presentation/controllers/controllers.dart';
import 'package:module_app/presentation/middlewares/middlewares.dart';

import 'package:module_app/presentation/pages/pages.dart';
import 'package:module_app/presentation/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => CountController().init());
  await Get.putAsync(() => StorageService().init());

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      unknownRoute: GetPage(
        name: "/notfound",
        page: () => const NotFoundPage(),
      ),
      getPages: [
        // root
        GetPage(
          name: "/",
          page: () => const RootPage(),
          binding: ViewBinding(),
        ),

        // other
        GetPage(
          name: "/second",
          page: () => SecondPage(),
          binding: CountBinding(),
          middlewares: [SessionMiddleware()],
        ),
        GetPage(
          name: "/third",
          page: () => ThirdPage(),
          binding: LazyCountBinding(),
        ),
        GetPage(
          name: "/fourth",
          page: () => FourthPage(),
        ),
      ],
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      translationsKeys: const {
        'en_US': {
          'welcome': 'Welcome',
          'page_root': 'Root Page',
          'page_login': 'Login Page',
          'page_register': 'Register Page',
          'page_notfound': 'Noutfound Page',
        },
      },
      locale: const Locale('en', 'US'),
    );
  }
}
