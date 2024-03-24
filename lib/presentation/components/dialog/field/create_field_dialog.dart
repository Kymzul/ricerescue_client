import 'package:flutter/material.dart';
import 'package:vhack_client/presentation/components/button/text_button.dart';
import 'package:vhack_client/presentation/components/textfield/date_textfield.dart';
import 'package:vhack_client/presentation/components/textfield/input_textfield.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

class CreateFieldDialog extends StatelessWidget {
  final TextEditingController tcFieldName;
  final VoidCallback saveField;
  const CreateFieldDialog(
      {super.key, required this.tcFieldName, required this.saveField});

  @override
  Widget build(BuildContext context) {
    return buildContent(context);
  }

  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        buildTitle(context),
        const SizedBox(
          height: 20,
        ),
        buildTextFieldForm(),
        const SizedBox(
          height: 20,
        ),
        buildButtonForm(context)
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
      child: Column(
        children: [
          buildTopChip(),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Fiels Detail',
            style: CustomTextStyle.getTitleStyle(
                context, 18, CustomColor.getTertieryColor(context)),
          ),
        ],
      ),
    );
  }

  Widget buildTextFieldForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          InputTextField(
              tcInput: tcFieldName, tcTitle: 'Field Name', tcIcon: Icons.edit),
          const SizedBox(
            height: 10,
          ),
          InputTextField(
              tcInput: tcFieldName,
              tcTitle: 'Cultivation Area',
              tcIcon: Icons.area_chart_outlined),
          const SizedBox(
            height: 10,
          ),
          InputTextField(
              tcInput: tcFieldName,
              tcTitle: 'Paddy Crop Type',
              tcIcon: Icons.forest_outlined),
          const SizedBox(
            height: 10,
          ),
          DateTextField(
              tcDate: tcFieldName,
              onTap: () {},
              hintTextField: 'Seeding Date (Optional)'),
        ],
      ),
    );
  }

  Widget buildButtonForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextOnlyButton(
              buttonTitle: 'Confirm',
              onPressed: saveField,
              isMain: true,
              borderRadius: 12),
          const SizedBox(
            height: 10,
          ),
          TextOnlyButton(
              buttonTitle: 'Cancel',
              onPressed: () {
                Navigator.pop(context);
              },
              isMain: false,
              borderRadius: 12)
        ],
      ),
    );
  }

  Widget buildTopChip() {
    return Container(
      width: 50,
      height: 5,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(32)),
    );
  }
}
