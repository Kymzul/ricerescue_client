import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vhack_client/controller/provider/field/type_field_provider.dart';
import 'package:vhack_client/presentation/components/card/field/field_card.dart';
import 'package:vhack_client/presentation/components/dialog/field/filter_field_dialog.dart';
import 'package:vhack_client/presentation/components/textfield/search_textfield.dart';
import 'package:vhack_client/presentation/screen/util/field/field_screen.dart';
import 'package:vhack_client/presentation/screen/util/field/first_field_screen.dart';
import 'package:vhack_client/shared/constant/custom_appbar.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_date.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

class HistoryFieldScreen extends StatefulWidget {
  HistoryFieldScreen({super.key});

  @override
  State<HistoryFieldScreen> createState() => _HistoryFieldScreenState();
}

class _HistoryFieldScreenState extends State<HistoryFieldScreen> {
  final TextEditingController tcSearch = TextEditingController();
  bool isSearch = false;

  List<Map<String, dynamic>> listField = [
    {
      'fieldID': '1',
      'fieldName': 'Field 1',
      'fieldPCT': 'Unknown',
      'fieldCA': 'Rainfed Lowland'
    },
  ];

  void selectSearch() {
    setState(() {
      isSearch = !isSearch;
    });
  }

  void showFieldDialog() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12))),
      context: context,
      builder: (context) {
        return const Wrap(
          children: [
            SizedBox(
                width: double.maxFinite,
                height: 400,
                child: SingleChildScrollView(child: FilterFieldDialog())),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TypeFieldProvider>(
      builder: (context, value, child) {
        return Scaffold(
            backgroundColor: CustomColor.getBackgroundColor(context),
            appBar: CustomAppBar.BuildMainAppBar(context, true),
            floatingActionButton: buildFloatButton(),
            body: Column(
              children: [
                buildHeader(),
                const SizedBox(
                  height: 10,
                ),
                isSearch
                    ? buildSearchField()
                    : buildMiddle(value.selectedFilter),
                if (isSearch)
                  const SizedBox(
                    height: 10,
                  ),
                buildListField(value.selectedFilter)
              ],
            ));
      },
    );
  }

  FloatingActionButton buildFloatButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FirstFieldScreen(),
        ));
      },
      child: Icon(
        Icons.add,
        color: CustomColor.getWhiteColor(context),
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Fields',
            style: CustomTextStyle.getTitleStyle(
                context, 21, CustomColor.getTertieryColor(context)),
          ),
          Text(
            'All your field that has been you created store here.',
            style: CustomTextStyle.getSubTitleStyle(
                context, 15, CustomColor.getTertieryColor(context)),
          )
        ],
      ),
    );
  }

  Widget buildMiddle(Map<String, dynamic> filter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildAreaChip(filter),
          Row(
            children: [
              buildIconButton(
                  voidCallback: () {
                    showFieldDialog();
                  },
                  iconData: Icons.sort_outlined),
              buildIconButton(
                  voidCallback: () {
                    selectSearch();
                  },
                  iconData: Icons.search)
            ],
          )
        ],
      ),
    );
  }

  Widget buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: SearchTextfield(
              title: 'Search your field name',
              tcSearch: tcSearch,
              onChanged: (p0) {},
            ),
          ),
          IconButton(
              onPressed: () {
                selectSearch();
              },
              icon: const Icon(Icons.clear))
        ],
      ),
    );
  }

  Widget buildAreaChip(Map<String, dynamic> filter) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: CustomColor.getPrimaryColor(context)),
        child: Row(
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: filter['filterColor']),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              filter['filterTitle'],
              style: CustomTextStyle.getTitleStyle(
                  context, 12, CustomColor.getTertieryColor(context)),
            ),
          ],
        ));
  }

  Widget buildListField(Map<String, dynamic> selectedFilter) {
    return Expanded(
        child: ListView.builder(
      itemCount: listField.length,
      itemBuilder: (context, index) {
        final field = listField[index];
        if (field['fieldCA'] == selectedFilter['filterTitle'] ||
            selectedFilter['filterTitle'] == 'All') {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FieldScreen(),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: FieldCard(
                eachField: field,
              ),
            ),
          );
        }
        return Container();
      },
    ));
  }

  Widget buildIconButton(
      {required VoidCallback voidCallback, required IconData iconData}) {
    return IconButton(
        onPressed: voidCallback,
        icon: Icon(
          iconData,
          color: CustomColor.getSecondaryColor(context),
        ));
  }
}
