import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vhack_client/presentation/components/button/icon_text_button.dart';
import 'package:vhack_client/presentation/components/button/text_button.dart';
import 'package:vhack_client/presentation/components/textfield/input_textfield.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

class AddMachineScreen extends StatefulWidget {
  const AddMachineScreen({super.key});

  @override
  State<AddMachineScreen> createState() => _AddMachineScreenState();
}

class _AddMachineScreenState extends State<AddMachineScreen> {
  final TextEditingController tcMachineName = TextEditingController();
  final TextEditingController tcPersonInCharge = TextEditingController();
  final TextEditingController tcAddInfo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.getBackgroundColor(context),
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: buildImage(),
            ),
            buildSizeBox(20),
            SliverToBoxAdapter(
              child: buildText(),
            ),
            buildSizeBox(20),
            SliverToBoxAdapter(
              child: buildUploadButton(),
            ),
            buildSizeBox(40),
            SliverToBoxAdapter(
              child: buildTextFieldForm(),
            ),
            buildSizeBox(40),
            SliverToBoxAdapter(
              child: buildButtonForm(),
            )
          ],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: CustomColor.getSecondaryColor(context),
      centerTitle: true,
      title: Text(
        'Add Machines',
        style: CustomTextStyle.getTitleStyle(
            context, 18, CustomColor.getWhiteColor(context)),
      ),
    );
  }

  Widget buildImage() {
    return Image.asset(
      "assets/gif/tractorMachines.gif",
      height: 200.0,
      width: 200.0,
    );
  }

  Widget buildText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Add Your Machines',
            style: CustomTextStyle.getTitleStyle(
                context, 18, CustomColor.getTertieryColor(context)),
          ),
          Text(
            'AI-Powered Paddy Analysis for Optimal Health',
            style: CustomTextStyle.getSubTitleStyle(
                context, 15, CustomColor.getTertieryColor(context)),
          )
        ],
      ),
    );
  }

  Widget buildUploadButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IconTextButton(
        buttonTitle: 'Upload Image',
        buttonIcon: Icons.photo_size_select_actual_outlined,
        onPressed: () {},
      ),
    );
  }

  Widget buildTextFieldForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          InputTextField(
              tcInput: tcMachineName,
              tcTitle: 'Machine Name',
              tcIcon: Icons.photo_size_select_actual_outlined),
          const SizedBox(
            height: 10,
          ),
          InputTextField(
              tcInput: tcPersonInCharge,
              tcTitle: 'Person In Charge',
              tcIcon: Icons.group_outlined),
          const SizedBox(
            height: 10,
          ),
          InputTextField(
              tcInput: tcAddInfo,
              tcTitle: 'Additional Info',
              tcIcon: Icons.add_outlined),
        ],
      ),
    );
  }

  Widget buildButtonForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextOnlyButton(
              buttonTitle: 'Confirm',
              onPressed: () {},
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

  Widget buildSizeBox(double value) {
    return SliverToBoxAdapter(
      child: SizedBox(height: value),
    );
  }
}
