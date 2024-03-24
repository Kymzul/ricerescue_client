import 'package:flutter/material.dart';

import '../../../../shared/constant/custom_color.dart';
import '../../../../shared/constant/custom_textstyle.dart';
import '../../../components/card/service/user_service_card.dart';
import '../user/user_detail_screen.dart';

class ServicePFScreen extends StatefulWidget {
  const ServicePFScreen({super.key});

  @override
  State<ServicePFScreen> createState() => _ServicePFScreenState();
}

class _ServicePFScreenState extends State<ServicePFScreen> {
  final List<Map<String, dynamic>> listUser = [
    {
      'userName': 'Lim Leejing',
      'userAvatar':
          'https://media.licdn.com/dms/image/D5603AQH3Z0I6EFHSOw/profile-displayphoto-shrink_200_200/0/1708793327557?e=1716422400&v=beta&t=JKh9k6pTGpwTwB2IY_SkLj_-OyZ_TRh2gbQv0gbAhLA',
      'userJobType': 'Agricultural Engineer',
      'userAge': '39 Years old',
      'userExperience': '4 years',
      'userAbout':
          'Lim Leejing, a seasoned Agricultural Engineer with 4 years of experience, specializes in optimizing drone-based solutions for agricultural needs.',
      'userCompanyName': 'MZM TUALANG ENTERPRISE',
      'userDescription':
          'MZM TUALANG ENTERPRISE specializes in agriculture-drone related services, including the spraying of insecticides, pesticides, weed, and fungus control.',
      'userOperatingHours': [
        {'operatingDay': 'Monday', 'operatingHour': '9:00 AM - 6:30 PM'},
        {'operatingDay': 'Tuesday', 'operatingHour': '9:00 AM - 6:30 PM'},
        {'operatingDay': 'Wednesday', 'operatingHour': '9:00 AM - 6:30 PM'},
        {'operatingDay': 'Thursday', 'operatingHour': '9:00 AM - 6:30 PM'},
        {'operatingDay': 'Friday', 'operatingHour': '9:00 AM - 6:30 PM'},
        {'operatingDay': 'Saturday', 'operatingHour': 'Closed'},
        {'operatingDay': 'Sunday', 'operatingHour': 'Closed'}
      ]
    },
    {
      'userName': 'Syafiq Halim',
      'userAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfv_5So7EzBFWAr-JJH8q_ME2V9LsZEdhrnQ&usqp=CAU',
      'userJobType': 'Agriculture service experts',
      'userAge': '28 Years old',
      'userExperience': '3 years',
      'userAbout':
          'Syafiq Halim, a 28-year-old agriculture service expert with 3 years of experience, is dedicated to leveraging drone technology for efficient farming practices and agricultural automation.',
      'userCompanyName': 'Aeros Geotech Sdn Bhd',
      'userDescription':
          'AEROS GEOTECH SDN. BHD., established in June 2020 in Malaysia, specializes in drone consultancy and automation services for agriculture, offering unmanned aerial systems for tasks such as spraying, seeding, mapping, surveying, and structural inspection. They also develop and maintain agriculture-related software applications.',
      'userOperatingHours': []
    },
  ];

  List listChip = [
    ['Pesticides', false],
    ['Fertilizing', false]
  ];

  void setSelected(bool value, int index) {
    setState(() {
      listChip[index][1] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.getBackgroundColor(context),
        appBar: buildAppBar(),
        body: Column(
          children: [
            buildListChip(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: listUser.length,
              itemBuilder: (context, index) {
                return buildUserServiceCard(listUser[index]);
              },
            ))
          ],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: CustomColor.getSecondaryColor(context),
      elevation: 0.5,
      centerTitle: true,
      title: Text(
        'Pesticides & Fertilizing',
        style: CustomTextStyle.getTitleStyle(
            context, 18, CustomColor.getWhiteColor(context)),
      ),
    );
  }

  Widget buildListChip() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listChip.length,
          itemBuilder: (context, index) {
            String eachChip = listChip[index][0];
            bool eachSelected = listChip[index][1];
            return buildChip(eachChip, eachSelected, index);
          },
        ),
      ),
    );
  }

  Widget buildChip(String eachChip, bool eachSelected, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(eachChip),
        labelStyle: CustomTextStyle.getTitleStyle(
            context,
            12,
            eachSelected
                ? CustomColor.getWhiteColor(context)
                : CustomColor.getTertieryColor(context)),
        backgroundColor: Colors.black26,
        selectedColor: CustomColor.getSecondaryColor(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        selected: eachSelected,
        onSelected: (value) {
          setSelected(value, index);
        },
      ),
    );
  }

  Widget buildUserServiceCard(final userEntity) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: UserServiceCard(
        userEntity: userEntity,
        voidCallback: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserDetailScreen(
              eachUser: userEntity,
            ),
          ));
        },
      ),
    );
  }
}
