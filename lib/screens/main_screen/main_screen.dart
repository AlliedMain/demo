import 'package:demo/config/app_config.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        AppWidgets.exitDialog();
      },
      child: GetBuilder<MainController>(
          builder: (controller) => Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppWidgets
                  .titleBar(AppStrings.appName, isBack: false, actions: [
                Icon(controller.isDarkMode ? Icons.light_mode : Icons.dark_mode)
                    .asButton(
                  onTap: () {
                    controller.isDarkMode = !controller.isDarkMode;
                    StorageHelper().isDarkMode = controller.isDarkMode;
                    Get.changeThemeMode(controller.isDarkMode
                        ? ThemeMode.dark
                        : ThemeMode.light);
                    controller.update();
                  },
                ).paddingOnly(right: AppDimens.dimen20)
              ]),
              body: controller.isLoading
                  ? AppWidgets.getLoadingView()
                  : controller.mainData == null
                      ? AppWidgets.getDataNotFoundView()
                      : Center(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              AppWidgets.getNetworkImage(
                                      controller.mainData?.iconUrl ?? '',
                                      fit: BoxFit.cover,
                                      width: AppDimens.dimen200,
                                      height: AppDimens.dimen200)
                                  .align()
                                  .asButton(
                                    onTap: () =>
                                        Get.to(() => const DemoScreen()),
                                  ),
                              Text(
                                controller.mainData?.value ?? '',
                                textAlign: TextAlign.center,
                                style: Get.theme.textTheme.headlineMedium,
                              ).paddingSymmetric(vertical: AppDimens.dimen20)
                            ],
                          ).paddingAll(AppDimens.dimen20),
                        ))),
    );
  }
}
