import 'package:flutter/material.dart';
import 'package:vhack_client/presentation/components/button/icon_button.dart';
import 'package:vhack_client/presentation/components/button/text_button.dart';
import 'package:vhack_client/presentation/components/card/user_avatar_card.dart';
import 'package:vhack_client/presentation/components/card/team/user_member_card.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

class TeamMemberTabbar extends StatefulWidget {
  const TeamMemberTabbar({super.key});

  @override
  State<TeamMemberTabbar> createState() => _TeamMemberTabbarState();
}

class _TeamMemberTabbarState extends State<TeamMemberTabbar> {
  List<Map<String, dynamic>> listUser = [
    {
      'userID': '1',
      'userName': 'Haris',
      'userAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXRPDQKY4pgjvClQRGa7bL37IKFG0FZiViZQ&usqp=CAU',
      'userPosition': 'Head of Farmer',
      'userStatus': 'Members'
    },
    {
      'userID': '2',
      'userName': 'Hakim',
      'userAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJJS324sJIJ0Hzx5TdBwWHD_7snDCzLX0FfA&usqp=CAU',
      'userPosition': 'Producers',
      'userStatus': 'Producers'
    },
    {
      'userID': '3',
      'userName': 'Haziq',
      'userAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlHTd7q7JcF6px8nAR6S7t2aD9b3oXazKuRA&usqp=CAU',
      'userPosition': 'Owner',
      'userStatus': 'Owner'
    },
    {
      'userID': '4',
      'userName': 'Irfan',
      'userAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjuNz23ISrNeyjlqMOWHYKXP-_9bQdrWcOnA&usqp=CAU',
      'userPosition': 'Irrigation Worker',
      'userStatus': 'Advisors'
    }
  ];

  List memberChips = [
    ['Members', false],
    ['Employees', false],
    ['Advisors', false],
    ['Producers', false]
  ];

  void setSelected(bool value, int index) {
    setState(() {
      memberChips[index][1] = value;
    });
    print('${memberChips[index][0]} ${memberChips[index][1]}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.getPrimaryColor(context),
      body: Column(
        children: [
          buildButton(),
          buildListChip(),
          const SizedBox(
            height: 10,
          ),
          buildListMember()
        ],
      ),
    );
  }

  Widget buildButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MaterialButton(
            color: CustomColor.getBackgroundColor(context),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {
              showCustomDialog(context);
            },
            child: Text(
              'Add Member',
              style: CustomTextStyle.getTitleStyle(
                  context, 12, CustomColor.getSecondaryColor(context)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListChip() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: memberChips.length,
          itemBuilder: (context, index) {
            String eachMemberChip = memberChips[index][0];
            bool eachSelected = memberChips[index][1];
            return buildChip(eachMemberChip, eachSelected, index);
          },
        ),
      ),
    );
  }

  Widget buildChip(String eachMemberChip, bool eachSelected, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(eachMemberChip),
        labelStyle: CustomTextStyle.getTitleStyle(
            context,
            12,
            eachSelected
                ? CustomColor.getWhiteColor(context)
                : CustomColor.getTertieryColor(context)),
        backgroundColor: Colors.black12,
        selectedColor: CustomColor.getSecondaryColor(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        selected: eachSelected,
        onSelected: (value) {
          setSelected(value, index);
        },
      ),
    );
  }

  Widget buildListMember() {
    return Expanded(
      child: ListView.builder(
        itemCount: listUser.length,
        itemBuilder: (context, index) {
          return buildUserMemberCard(listUser[index]);
        },
      ),
    );
  }

  Widget buildUserMemberCard(final userEntity) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: UserMemberCard(
        userEntity: userEntity,
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
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
                          style: CustomTextStyle.getSubTitleStyle(context, 12,
                              CustomColor.getTertieryColor(context)),
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: CustomColor.getSecondaryColor(
                                          context),
                                      width: 2))),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconOnlyButton(
                          iconData: Icons.add,
                          onPressed: () {},
                          borderRadius: 12)
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(20, (index) {
                          return ListTile(
                            title: Text(
                              'muhdhakim27112002@gmail.com',
                              style: CustomTextStyle.getSubTitleStyle(context,
                                  12, CustomColor.getTertieryColor(context)),
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
                                style: CustomTextStyle.getTitleStyle(
                                    context,
                                    12,
                                    CustomColor.getTertieryColor(context)))),
                      ),
                      MaterialButton(
                        color: CustomColor.getSecondaryColor(context),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        onPressed: () {},
                        child: Center(
                            child: Text('Send Invites',
                                style: CustomTextStyle.getTitleStyle(context,
                                    12, CustomColor.getWhiteColor(context)))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(0, -1), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(0, 1), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
