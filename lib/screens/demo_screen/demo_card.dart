import 'package:demo/config/app_config.dart';


class DemoCard extends StatelessWidget {
  const DemoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical:AppDimens.dimen10),
      padding: EdgeInsets.all(AppDimens.dimen20),
      decoration: AppDecoration.cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${AppStrings.name}: Allied Technology',
              style: Theme.of(context).textTheme.displayLarge),
          Text('This card is just for demo.',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall)
              .paddingOnly(top: AppDimens.dimen10),
        ],
      ),
    );
  }
}
