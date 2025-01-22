import 'package:get/get.dart';
import 'package:prelura_test_app/app/wardrobe/wardrobe_screen.dart';
import 'package:prelura_test_app/src/controller/wardrobe_controller.dart';

class Routes {
  //Splash screens
  static const wardrobe = "/wardrobe";
  //========================= GET PAGES ==========================\\
  static final getPages = [
    GetPage(
      name: wardrobe,
      page: () => const WardrobeScreen(),
      binding: BindingsBuilder(() => Get.lazyPut<WardrobeController>(
            () => WardrobeController(),
          )),
    ),
  ];
}
