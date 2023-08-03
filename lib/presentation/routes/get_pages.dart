import 'package:get/get.dart';

import 'package:module_app/presentation/pages/pages.dart';
import 'routes.dart';

class GetPages {
  static List<GetPage> routers = [
    // root
    GetPage(
      name: Routes.ROOT,
      page: () => const RootPage(),
    ),

    // other
    GetPage(
      name: "/second",
      page: () => SecondPage(),
    ),
    GetPage(
      name: "/third",
      page: () => ThirdPage(),
    ),
  ];

  // notfound
  static GetPage notFound = GetPage(
    name: Routes.NOTFOUND,
    page: () => const NotFoundPage(),
  );
}
