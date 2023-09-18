import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:module_app/firebase_options.dart';
import 'package:module_app/presentation/bindings/bindings.dart';
import 'package:module_app/presentation/controllers/auth.controller.dart';
import 'package:module_app/presentation/controllers/messaging_controller.dart';
import 'package:module_app/presentation/pages/login/login.dart';

import 'package:module_app/presentation/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  await MessagingController().initPushNotification();
  await MessagingController().initLocalNotification();

  runApp(Main());
}

class Main extends StatelessWidget {
  Main({super.key});
  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: _authController.isLoggedIn.value ? '/' : '/login',
      initialRoute: '/',
      unknownRoute: GetPage(
        name: "/notfound",
        page: () => const NotFoundPage(),
      ),
      getPages: [
        // root
        GetPage(
          name: "/",
          page: () => ArticlePage(),
          binding: ArticleBinding(),
        ),
        GetPage(
          name: "/login",
          page: () => LoginPage(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: "/register",
          page: () => RegisterPage(),
          binding: AuthBinding(),
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
