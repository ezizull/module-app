import 'package:get/get.dart';

import 'package:module_app/presentation/pages/pages.dart';
import 'package:module_app/presentation/bindings/bindings.dart';
import 'package:module_app/presentation/middlewares/middlewares.dart';
import 'routes.dart';

class GetPages {
  static List<GetPage> routers = [
    // root
    GetPage(
      name: Routes.ROOT,
      page: () => const RootPage(),
      binding: RootBinding(),
      middlewares: [SessionMiddleware()],
    ),

    // auth
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
  ];

  // notfound
  static GetPage notFound = GetPage(
    name: Routes.NOTFOUND,
    page: () => const NotFoundPage(),
  );
}
