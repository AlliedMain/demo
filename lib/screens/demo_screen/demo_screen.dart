import 'package:demo/config/app_config.dart';
import 'package:demo/widgets/app_textfield/app_textfield.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.titleBar('Demo List'),
      body: Column(
        children: [
          AppTextField(
            hintText: AppStrings.search,
          ).paddingOnly(bottom: AppDimens.dimen10),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const DemoCard();
              },
            ),
          ),
        ],
      ).paddingAll(AppDimens.dimen20),
    );
  }
}
