import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../shared/constant/custom_color.dart';
import '../../../../../shared/constant/custom_textstyle.dart';

class AISnapDiseaseScreen extends StatelessWidget {
  AISnapDiseaseScreen({super.key});

  String bacterialLeafBlightDescription = '''
Bacterial leaf blight is a common disease in paddy plants caused by bacteria. 
It manifests as brown lesions on leaves, which can significantly reduce crop yield. 
This disease spreads quickly, especially in humid conditions.
''';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildImage(context),
        const SizedBox(
          height: 40,
        ),
        buildDetail(context)
      ],
    );
  }

  Widget buildImage(BuildContext context) {
    return Image.asset(
      'assets/bacterial.png',
      height: 250,
      width: 250,
    );
  }

  Widget buildDetail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text('Disease',
              style: CustomTextStyle.getTitleStyle(
                  context, 21, CustomColor.getTertieryColor(context))),
          const SizedBox(
            height: 20,
          ),
          Text('Bacterial Leaf Blight',
              style: CustomTextStyle.getSubTitleStyle(
                  context, 18, CustomColor.getTertieryColor(context))),
          const SizedBox(
            height: 20,
          ),
          Text(
            bacterialLeafBlightDescription,
            style: CustomTextStyle.getSubTitleStyle(
                context, 14, CustomColor.getTertieryColor(context)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
