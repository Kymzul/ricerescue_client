import 'package:flutter/material.dart';
import 'package:vhack_client/presentation/components/card/user_avatar_card.dart';

import '../../../shared/constant/custom_color.dart';
import '../../../shared/constant/custom_textstyle.dart';

class AnalyzeCard extends StatelessWidget {
  const AnalyzeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(16),
          color: CustomColor.getPrimaryColor(context)),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const UserAvatarCard(
            userAvatar:
                'https://firebasestorage.googleapis.com/v0/b/twitter-clone-fullstack.appspot.com/o/users%2Fkymzul%40gmail.com?alt=media&token=f9506b23-8e57-4b07-b90e-37f116fc1563',
            radius: 50),
        title: Text(
          '2 Bacterial Leaf',
          style: CustomTextStyle.getTitleStyle(
              context, 15, CustomColor.getTertieryColor(context)),
        ),
        subtitle: Text(
          'Sungai Petani, Kedah',
          style: CustomTextStyle.getSubTitleStyle(
              context, 12, CustomColor.getTertieryColor(context)),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '12:00 p.m.',
              style: CustomTextStyle.getTitleStyle(
                  context, 15, CustomColor.getSecondaryColor(context)),
            ),
            Text(
              'Upload',
              style: CustomTextStyle.getSubTitleStyle(
                  context, 12, CustomColor.getTertieryColor(context)),
            ),
          ],
        ),
      ),
    );
  }
}
