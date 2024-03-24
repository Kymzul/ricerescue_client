import 'package:flutter/material.dart';
import 'package:vhack_client/model/chat_entity.dart';

import '../../../../shared/constant/custom_color.dart';
import '../../../../shared/constant/custom_textstyle.dart';

class ChatCard extends StatelessWidget {
  final ChatEntity eachChat;
  ChatCard({super.key, required this.eachChat});

  @override
  Widget build(BuildContext context) {
    bool isUser = eachChat.chatRole == 'user';

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isUser
              ? CustomColor.getSecondaryColor(context)
              : CustomColor.getPrimaryColor(context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  eachChat.chatRole == 'system'
                      ? 'assets/image.jpg'
                      : 'assets/resumegambar.jpg',
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eachChat.chatRole == 'system' ? 'System' : 'User',
                  style: CustomTextStyle.getTitleStyle(
                      context,
                      15,
                      isUser
                          ? CustomColor.getWhiteColor(context)
                          : CustomColor.getTertieryColor(context)),
                ),
                Text(
                  eachChat.chatContent!,
                  style: CustomTextStyle.getSubTitleStyle(
                      context,
                      15,
                      isUser
                          ? CustomColor.getWhiteColor(context)
                          : CustomColor.getTertieryColor(context)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
