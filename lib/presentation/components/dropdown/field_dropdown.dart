import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

import '../../../shared/constant/custom_color.dart';

class FieldDropDown extends StatelessWidget {
  final List<String> fields;
  final String? selectedField;
  final void Function(dynamic)? onChanged;
  final TextEditingController tcField;
  const FieldDropDown(
      {super.key,
      required this.fields,
      required this.selectedField,
      required this.onChanged,
      required this.tcField});

  @override
  Widget build(BuildContext context) {
    return buildDropDownField(context);
  }

  Widget buildDropDownField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: CustomColor.getPrimaryColor(context)),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(12),
        hint: Text(
          'Your Fields',
          style: CustomTextStyle.getSubTitleStyle(context, 15, Colors.grey),
        ),
        value: selectedField,
        items: fields.map((valueItem) {
          return DropdownMenuItem<String>(
              value: valueItem.toString(),
              child: Text(
                valueItem,
                style: CustomTextStyle.getSubTitleStyle(
                    context, 15, CustomColor.getTertieryColor(context)),
              ));
        }).toList(),
        onChanged: onChanged,
        icon: Icon(
          Icons.area_chart_outlined,
          color: CustomColor.getSecondaryColor(context),
        ),
        iconSize: 32,
        isExpanded: true,
        dropdownColor: CustomColor.getPrimaryColor(context),
        menuMaxHeight: 400,
      ),
    );
  }

  Widget buildDropDownField1(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
      isExpanded: true,
      hint: Text('Select Item',
          style: CustomTextStyle.getSubTitleStyle(context, 12, Colors.grey)),
      items: fields
          .map((item) => DropdownMenuItem<String>(child: Text(item)))
          .toList(),
      value: selectedField,
      onChanged: onChanged,
    ));
  }

  DropdownSearchData buildDropDownSearchData() {
    return DropdownSearchData(
      searchController: tcField,
      searchInnerWidgetHeight: 50,
      searchInnerWidget: Container(
        height: 50,
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 4,
          right: 8,
          left: 8,
        ),
        child: TextFormField(
          expands: true,
          minLines: null,
          maxLength: null,
          controller: tcField,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            hintText: 'Search for an item...',
            hintStyle: const TextStyle(fontSize: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
