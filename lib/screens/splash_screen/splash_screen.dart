import 'package:demo/config/app_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              height: AppDimens.dimen350,
              width: AppDimens.dimen350,
            ),
            Text(
              AppStrings.appName,
              style: Get.theme.textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
