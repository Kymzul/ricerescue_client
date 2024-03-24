import 'package:flutter/material.dart';

import '../../../../shared/constant/custom_color.dart';
import '../../../../shared/constant/custom_textstyle.dart';
import '../../button/icon_button.dart';

class MemberDialog extends StatelessWidget {
  const MemberDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return buildMemberDialog(context);
  }

  Widget buildMemberDialog(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CustomColor.getPrimaryColor(context)),
        height: 400,
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Invite your team',
                    style: CustomTextStyle.getTitleStyle(
                        context, 18, CustomColor.getTertieryColor(context)),
                  ),
                  Text(
                    'Your project has been created, now invite your team to continue',
                    style: CustomTextStyle.getTitleStyle(
                        context, 12, CustomColor.getTertieryColor(context)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: CustomColor.getSecondaryColor(context),
                      style: CustomTextStyle.getSubTitleStyle(
                          context, 12, CustomColor.getTertieryColor(context)),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: CustomColor.getSecondaryColor(context),
                                  width: 2))),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconOnlyButton(
                      iconData: Icons.add, onPressed: () {}, borderRadius: 12)
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(20, (index) {
                      return ListTile(
                        title: Text(
                          'muhdhakim27112002@gmail.com',
                          style: CustomTextStyle.getSubTitleStyle(context, 12,
                              CustomColor.getTertieryColor(context)),
                        ),
                        trailing: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: CustomColor.getTertieryColor(context)),
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                        child: Text('Cancel',
                            style: CustomTextStyle.getTitleStyle(context, 12,
                                CustomColor.getTertieryColor(context)))),
                  ),
                  MaterialButton(
                    color: CustomColor.getSecondaryColor(context),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: () {},
                    child: Center(
                        child: Text('Send Invites',
                            style: CustomTextStyle.getTitleStyle(context, 12,
                                CustomColor.getWhiteColor(context)))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
