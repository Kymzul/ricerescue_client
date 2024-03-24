import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vhack_client/presentation/components/chart/custom_slider.dart';
import 'package:vhack_client/shared/constant/custom_appbar.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

class AISnapNutrientScreen extends StatelessWidget {
  AISnapNutrientScreen({super.key});

  String nutrientDeficiencies = '''
Nutrient deficiencies occur when plants don't get enough essential elements for growth and development. 
This can lead to various symptoms depending on the nutrient lacking.
''';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildProgressBar(context),
        const SizedBox(
          height: 40,
        ),
        buildDetail(context)
      ],
    );
  }

  Widget buildProgressBar(BuildContext context) {
    return CircularPercentIndicator(
      percent: 0.5,
      radius: 200,
      lineWidth: 30,
      animation: true,
      animateFromLastPercent: true,
      progressColor: CustomColor.getSecondaryColor(context),
      backgroundColor: CustomColor.getSecondaryColor(context).withOpacity(0.2),
      center: Text('70 %',
          style: CustomTextStyle.getTitleStyle(
              context, 21, CustomColor.getSecondaryColor(context))),
    );
  }

  Widget buildDetail(BuildContext context) {
    return Column(
      children: [
        Text('Nutrient',
            style: CustomTextStyle.getTitleStyle(
                context, 21, CustomColor.getTertieryColor(context))),
        const SizedBox(
          height: 20,
        ),
        Text('2nd Phase of Deficiency',
            style: CustomTextStyle.getSubTitleStyle(
                context, 18, CustomColor.getTertieryColor(context))),
        const SizedBox(
          height: 20,
        ),
        Text(
          nutrientDeficiencies,
          style: CustomTextStyle.getSubTitleStyle(
              context, 14, CustomColor.getTertieryColor(context)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
