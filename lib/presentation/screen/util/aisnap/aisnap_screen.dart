import 'package:flutter/material.dart';
import 'package:vhack_client/presentation/components/button/icon_text_button.dart';
import 'package:vhack_client/presentation/components/button/text_button.dart';
import 'package:vhack_client/presentation/screen/util/aisnap/aisnap_result/aisnap_nutrient.dart';
import 'package:vhack_client/presentation/screen/util/aisnap/aisnap_result_screen.dart';
import 'package:vhack_client/shared/constant/custom_appbar.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

class AISnapScreen extends StatefulWidget {
  AISnapScreen({super.key});

  @override
  State<AISnapScreen> createState() => _AISnapScreenState();
}

class _AISnapScreenState extends State<AISnapScreen> {
  String areaDefault = "Rainfed Lowland";
  List<String> areas = ['Rainfed Lowland', 'Irrigated Lowland', 'Upland'];

  String monthDefault = "1 month";
  List<String> months = [
    '1 month',
    '2 months',
    '3 months',
    '4 months',
    '5 months',
    '6 months'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.getBackgroundColor(context),
      appBar: CustomAppBar.BuildMainAppBar(context, false),
      body: Center(
        child: Column(
          children: [
            buildHeader(context),
            const SizedBox(
              height: 20,
            ),
            buildDropDownArea(),
            buildDropDownCalender(),
            const SizedBox(
              height: 20,
            ),
            buildButtonForm(),
            const SizedBox(
              height: 20,
            ),
            buildBottomForm()
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/DementiCare.png',
          height: 200,
          width: 200,
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
        ),
        Text('Examine Your Paddy',
            style: CustomTextStyle.getTitleStyle(
              context,
              18,
              CustomColor.getTertieryColor(context),
            )),
        Text('AI-Powered paddy analysis for optimal health',
            style: CustomTextStyle.getSubTitleStyle(
              context,
              15,
              CustomColor.getTertieryColor(context),
            ),
            textAlign: TextAlign.center),
      ],
    );
  }

  Widget buildDropDownArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: CustomColor.getPrimaryColor(context)),
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(12),
          value: areaDefault,
          items: areas.map((valueItem) {
            return DropdownMenuItem<String>(
                value: valueItem.toString(), child: Text(valueItem));
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                areaDefault = newValue;
              });
            }
          },
          isExpanded: true,
          icon: Icon(
            Icons.area_chart_outlined,
            color: CustomColor.getSecondaryColor(context),
          ),
          iconSize: 32,
          dropdownColor: CustomColor.getPrimaryColor(context),
        ),
      ),
    );
  }

  Widget buildDropDownCalender() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: CustomColor.getPrimaryColor(context)),
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(12),
          value: monthDefault,
          items: months.map((valueItem) {
            return DropdownMenuItem<String>(
                value: valueItem.toString(), child: Text(valueItem));
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                monthDefault = newValue;
              });
            }
          },
          isExpanded: true,
          icon: Icon(
            Icons.calendar_month_outlined,
            color: CustomColor.getSecondaryColor(context),
          ),
          iconSize: 32,
          dropdownColor: CustomColor.getPrimaryColor(context),
        ),
      ),
    );
  }

  Widget buildButtonForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          IconTextButton(
            buttonTitle: 'Upload Image',
            buttonIcon: Icons.image_outlined,
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('OR',
                style: CustomTextStyle.getTitleStyle(context, 18, Colors.grey)),
          ),
          IconTextButton(
            buttonTitle: 'Snap your paddy',
            buttonIcon: Icons.camera_alt,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget buildBottomForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          TextOnlyButton(
              buttonTitle: 'Confirm',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AISnapResultScreen(),
                ));
              },
              isMain: true,
              borderRadius: 12),
          const SizedBox(
            height: 10,
          ),
          TextOnlyButton(
              buttonTitle: 'Cancel',
              onPressed: () {},
              isMain: false,
              borderRadius: 12)
        ],
      ),
    );
  }
}
