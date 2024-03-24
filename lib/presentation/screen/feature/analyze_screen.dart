import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:vhack_client/controller/provider/crop/crop_provider.dart';
import 'package:vhack_client/model/crop_entity.dart';
import 'package:vhack_client/presentation/components/card/analyze_card.dart';
import 'package:vhack_client/presentation/components/card/user_avatar_card.dart';
import 'package:vhack_client/presentation/screen/util/aisnap/aisnap_screen.dart';
import 'package:vhack_client/shared/constant/custom_appbar.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

import '../../../shared/constant/custom_date.dart';

class AnalyzeScreen extends StatefulWidget {
  const AnalyzeScreen({super.key});

  @override
  State<AnalyzeScreen> createState() => _AnalyzeScreenState();
}

class _AnalyzeScreenState extends State<AnalyzeScreen> {
  List<String> informationString = [
    'Data Collection: We start by gathering a large dataset containing images of healthy paddy plants and those affected by leaf smut, bacterial leaf blight, and brown spot. These images serve as examples for the machine learning algorithm to learn from.',
    'Training the Algorithm: We then use this dataset to train our machine learning algorithm. During training, the algorithm learns to recognize patterns and features in the images that distinguish healthy paddy plants from those with diseases.',
    'Feature Extraction: The algorithm automatically identifies unique features in the images, such as the color, texture, and shape of the leaves, which are indicative of specific diseases.'
        'Classification: Once trained, the algorithm can classify new images of paddy plants into one of the predefined categories: healthy or diseased (leaf smut, bacterial leaf blight, or brown spot). It does this by comparing the features extracted from the new image to those learned during training.',
    'Output Interpretation: Finally, the app presents you with the classification results, indicating whether your paddy plants are healthy or showing signs of disease. This information can help you take timely action to prevent further spread and ensure a healthy harvest.'
  ];

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(
            'Know How We Collect Our Data',
            style: CustomTextStyle.getTitleStyle(
                context, 18, CustomColor.getTertieryColor(context)),
          ),
          content: SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(informationString.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      informationString[index],
                      style: CustomTextStyle.getSubTitleStyle(
                          context, 12, CustomColor.getTertieryColor(context)),
                    ),
                  );
                }),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32))),
                  backgroundColor: MaterialStateProperty.all(
                      CustomColor.getSecondaryColor(context))),
              child: Text(
                'Continue',
                style: CustomTextStyle.getTitleStyle(
                    context, 15, CustomColor.getWhiteColor(context)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CropProvider>(
      builder: (context, value, child) {
        List<CropEntity> crops = value.crops;
        return Scaffold(
            floatingActionButton: buildFloatingActionButton(context),
            backgroundColor: CustomColor.getBackgroundColor(context),
            appBar: CustomAppBar.BuildMainAppBar(context, false),
            body: Column(
              children: [
                Expanded(
                  child: buildListCrop(crops),
                ),
                buildBottom()
              ],
            ));
      },
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AISnapScreen(),
        ));
      },
      child: Icon(
        Icons.camera_alt,
        color: CustomColor.getWhiteColor(context),
      ),
    );
  }

  Widget buildListCrop(List<CropEntity> crops) {
    return GroupedListView(
      reverse: false,
      order: GroupedListOrder.DESC,
      elements: crops,
      groupBy: (crop) {
        String dateString = crop.cropAt!;
        DateTime dateTime = DateTime.parse(dateString);
        return DateTime(dateTime.year, dateTime.month, dateTime.day);
      },
      groupHeaderBuilder: (crop) {
        return Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color:
                      CustomColor.getSecondaryColor(context).withOpacity(0.5)),
              child: Text(
                ConvertDate.convertToDate(cropEntity: crop),
                style: CustomTextStyle.getTitleStyle(context, 15, Colors.white),
              )),
        );
      },
      indexedItemBuilder: (context, crop, index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: AnalyzeCard(),
        );
      },
    );
  }

  Widget buildBottom() {
    return GestureDetector(
      onTap: () {
        _showMyDialog();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Learn how we analyze',
              style: CustomTextStyle.getUnderlineStyle(
                  context, 12, CustomColor.getTertieryColor(context)),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.info_outline,
              size: 20,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
