import 'dart:io';
import 'package:demo/config/app_config.dart';

Future<void> main() async {
  await AppHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: StorageHelper().isDark == null
          ? ThemeMode.system
          : (StorageHelper().isDark ?? Get.isDarkMode)
              ? ThemeMode.dark
              : ThemeMode.light,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(FontDimen.textScaleFactor)),
          child: SafeArea(
            top: false,
            bottom: Platform.isIOS ? false : true,
            child: child!,
          ),
        );
      },
      home: const SplashScreen(),
    );
  }
}
