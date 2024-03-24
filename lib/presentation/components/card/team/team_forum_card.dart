import 'package:flutter/material.dart';

import '../../../../shared/constant/custom_color.dart';
import '../../../../shared/constant/custom_string.dart';
import '../../../../shared/constant/custom_textstyle.dart';
import '../user_avatar_card.dart';

class TeamForumCard extends StatelessWidget {
  final Map<String, dynamic> eachForum;
  const TeamForumCard({super.key, required this.eachForum});

  @override
  Widget build(BuildContext context) {
    return buildTeamForumCard(context);
  }

  Widget buildTeamForumCard(BuildContext context) {
    return ListTile(
      leading: UserAvatarCard(userAvatar: eachForum['userAvatar'], radius: 40),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            eachForum['userName'],
            style: CustomTextStyle.getTitleStyle(
                context, 15, CustomColor.getTertieryColor(context)),
          ),
          Text(
            eachForum['messageAt'],
            style: CustomTextStyle.getTitleStyle(
                context, 12, CustomColor.getTertieryColor(context)),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eachForum['messageContent'],
            style: CustomTextStyle.getSubTitleStyle(
              context,
              12,
              CustomColor.getTertieryColor(context),
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            eachForum['userFrom'],
            style: CustomTextStyle.getTitleStyle(
                context, 12, CustomColor.getTertieryColor(context)),
          ),
        ],
      ),
    );
  }
}
