import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vhack_client/presentation/components/button/small_button.dart';
import 'package:vhack_client/presentation/components/button/text_button.dart';
import 'package:vhack_client/presentation/components/card/user_avatar_card.dart';
import 'package:vhack_client/presentation/screen/util/integration/crop_vision_screen.dart';
import 'package:vhack_client/presentation/screen/util/integration/paddyx_screen.dart';
import 'package:vhack_client/presentation/screen/util/integration/tutorial_screen.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_string.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final double coverHeight = 200;
  final double profileHeight = 200;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: CustomColor.getBackgroundColor(context),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [buildTop(), buildContent(context)],
      ));

  Widget buildTop() {
    final top = coverHeight - profileHeight / 3;
    final bottom = profileHeight / 4;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: bottom),
              child: buildCoverImage()),
          buildUserAvatar(top)
        ]);
  }

  Widget buildCoverImage() => Image.asset(
        'assets/userprofilewallpaper.jpg',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      );

  Widget buildUserAvatar(double top) => Positioned(
      top: top,
      child: UserAvatarCard(
          userAvatar:
              'https://firebasestorage.googleapis.com/v0/b/twitter-clone-fullstack.appspot.com/o/users%2Fkymzul%40gmail.com?alt=media&token=f9506b23-8e57-4b07-b90e-37f116fc1563',
          radius: profileHeight / 2));

  Widget buildContent(BuildContext context) => Column(
        children: [
          buildTopContent(context),
          const SizedBox(
            height: 16,
          ),
          buildRowSocialIcon(context),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          buildRowAboutWidget(context),
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          buildAbout(context),
          const SizedBox(
            height: 16,
          ),
          buildContainerTile(context, true),
          const SizedBox(
            height: 16,
          ),
          buildContainerTile(context, false),
          const SizedBox(
            height: 16,
          ),
          buildLogoutButton(),
          const SizedBox(
            height: 16,
          ),
        ],
      );

  Widget buildTopContent(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Irfan Ghaphar',
            style: CustomTextStyle.getTitleStyle(
                context, 18, CustomColor.getTertieryColor(context)),
          ),
          Text(
            'Rice Farmer',
            style: CustomTextStyle.getTitleStyle(
                context, 15, CustomColor.getSecondaryColor(context)),
          ),
        ],
      );

  Widget buildRowSocialIcon(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSocialIcon(context, FontAwesomeIcons.instagram),
          const SizedBox(
            width: 16,
          ),
          buildSocialIcon(context, FontAwesomeIcons.facebook),
          const SizedBox(
            width: 16,
          ),
          buildSocialIcon(context, FontAwesomeIcons.whatsapp),
          const SizedBox(
            width: 16,
          ),
          buildSocialIcon(context, FontAwesomeIcons.tiktok),
        ],
      );

  Widget buildSocialIcon(BuildContext context, IconData iconData) =>
      CircleAvatar(
        backgroundColor: CustomColor.getSecondaryColor(context),
        radius: 25,
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: FaIcon(
                iconData,
                size: 24,
                color: CustomColor.getWhiteColor(context),
              ),
            ),
          ),
        ),
      );

  Widget buildRowAboutWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildAboutWidget(context, title: 'Age', desc: '40 Years Old'),
            const SizedBox(
              width: 32,
            ),
            Container(
              width: 1,
              height: 50,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 32,
            ),
            buildAboutWidget(context, title: 'Experience', desc: '5 Years')
          ],
        ),
      );

  Widget buildAboutWidget(BuildContext context,
          {required String title, required String desc}) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTextStyle.getTitleStyle(
                context, 15, CustomColor.getSecondaryColor(context)),
          ),
          Text(
            desc,
            style: CustomTextStyle.getTitleStyle(
                context, 15, CustomColor.getTertieryColor(context)),
          ),
        ],
      );

  Widget buildAbout(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: CustomTextStyle.getTitleStyle(
                  context, 15, CustomColor.getTertieryColor(context)),
            ),
            Text(
              'Irfan is a good farmer with strong agility skills. Irfan is a good farmer with strong agility skills.',
              style: CustomTextStyle.getSubTitleStyle(
                  context, 15, CustomColor.getTertieryColor(context)),
            )
          ],
        ),
      );

  Widget buildContainerTile(BuildContext context, bool isIntegration) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: CustomColor.getPrimaryColor(context),
              border: Border.all(color: Colors.grey, width: 0.5)),
          child: isIntegration
              ? buildIntegration(context)
              : buildAccount(context)),
    );
  }

  Widget buildIntegration(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Integrations',
          style: CustomTextStyle.getTitleStyle(
              context, 15, CustomColor.getTertieryColor(context)),
        ),
        buildTile(
            context: context,
            tileAssets: 'assets/Crop Vision.svg',
            tileTitle: 'Crop Vision',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CropVisionScreen(),
              ));
            },
            isSvg: true),
        buildTile(
            context: context,
            tileAssets: 'assets/PaddyX.svg',
            tileTitle: 'Paddy X',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PaddyXScreen(),
              ));
            },
            isSvg: true),
        buildTile(
            context: context,
            tileAssets: 'assets/integration/tuto.svg',
            tileTitle: 'Tutorial',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TutorailScreen(
                  isFromWelcomeExp: false,
                ),
              ));
            },
            isSvg: true)
      ],
    );
  }

  Widget buildAccount(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account',
          style: CustomTextStyle.getTitleStyle(
              context, 15, CustomColor.getTertieryColor(context)),
        ),
        buildTile(
            context: context,
            tileAssets: 'assets/Crop Vision.svg',
            tileTitle: 'Change Password',
            onTap: () {},
            isSvg: false),
        buildTile(
            context: context,
            tileAssets: 'assets/PaddyX.svg',
            tileTitle: 'Edit Profile',
            onTap: () {},
            isSvg: false)
      ],
    );
  }

  Widget buildTile(
      {required BuildContext context,
      required String tileAssets,
      required String tileTitle,
      required void Function()? onTap,
      required bool isSvg}) {
    return ListTile(
      onTap: onTap,
      leading: isSvg
          ? SvgPicture.asset(
              tileAssets,
              semanticsLabel: 'Paddy Logo',
              height: 40,
              width: 40,
            )
          : Icon(Icons.person),
      title: Text(
        tileTitle,
        style: CustomTextStyle.getTitleStyle(
            context, 12, CustomColor.getTertieryColor(context)),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: CustomColor.getTertieryColor(context),
      ),
    );
  }

  Widget buildLogoutButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextOnlyButton(
            buttonTitle: 'Log Out',
            onPressed: () {},
            isMain: true,
            borderRadius: 12),
      );
}
