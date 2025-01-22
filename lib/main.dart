import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/src/routes/routes.dart';
import 'package:prelura_test_app/theme/app_theme.dart';
import 'package:prelura_test_app/theme/colors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: kTransparentColor),
  );
  WidgetsFlutterBinding.ensureInitialized();
  // Lock device orientation to portrait up
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details);
    if (!kReleaseMode) return;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Android App
    return GetMaterialApp(
      title: "Prelura Test App",
      color: kPrimaryColor,
      navigatorKey: Get.key,
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      initialRoute: Routes.wardrobe,
      getPages: Routes.getPages,
      darkTheme: androidDarkTheme,
      themeMode: ThemeMode.dark,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        multitouchDragStrategy: MultitouchDragStrategy.sumAllPointers,
        scrollbars: true,
      ),
    );
  }
}
