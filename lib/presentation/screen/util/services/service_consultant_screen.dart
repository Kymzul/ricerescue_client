import 'package:flutter/material.dart';
import 'package:vhack_client/presentation/components/card/service/user_service_card.dart';
import 'package:vhack_client/presentation/components/card/user_avatar_card.dart';
import 'package:vhack_client/presentation/screen/util/user/user_detail_screen.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_string.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

class ServiceConsultantScreen extends StatefulWidget {
  const ServiceConsultantScreen({super.key});

  @override
  State<ServiceConsultantScreen> createState() =>
      _ServiceConsultantScreenState();
}

class _ServiceConsultantScreenState extends State<ServiceConsultantScreen> {
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
      'userName': 'Haiqal Helmy',
      'userAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa22Mk-7S3sGX2luKof6sE027AjZdEUxiITA&usqp=CAU',
      'userJobType': 'Agriculture Experts',
      'userAge': '40 Years old',
      'userExperience': '7 years',
      'userAbout':
          'Haiqal Helmy, a 40-year-old agricultural expert with 7 years of experience, adeptly navigates the agricultural landscape, leveraging innovative solutions to enhance farming practices.',
      'userCompanyName': 'Aonic Agriculture',
      'userDescription':
          'Aonic Agriculture specializes in selling insecticides, fungicides, drones, spare parts, and accessories to support modern farming practices.',
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
    {
      'userName': 'Azhari Haris',
      'userAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbgk0yfCOe55931lf6q0osfhGRU-fnH8Im1g&usqp=CAU',
      'userJobType': 'Agricultural Consultation Specialist',
      'userAge': '30 Years old',
      'userExperience': '3 years',
      'userAbout':
          'With a passion for agricultural advancement and three years of hands-on experience, Azhari specializes in providing expert consultation services to farmers and agribusinesses.',
      'userCompanyName': 'Agrobank',
      'userDescription':
          'Agrobank is a leading financial institution in Malaysia dedicated to serving the agricultural sector. Established in 1969, Agrobank offers a wide range of financial products and services tailored to the unique needs of farmers, agropreneurs, and agribusinesses. From loans and financing to savings and advisory services, Agrobank plays a crucial role in supporting the growth and development of Malaysia\'s agriculture industry.',
      'userOperatingHours': [
        {'operatingDay': 'Saturday', 'operatingHour': 'Closed'},
        {'operatingDay': 'Sunday', 'operatingHour': 'Closed'},
        {'operatingDay': 'Monday', 'operatingHour': '9:00 AM - 4:00 PM'},
        {'operatingDay': 'Tuesday', 'operatingHour': '9:00 AM - 4:00 PM'},
        {'operatingDay': 'Wednesday', 'operatingHour': '9:00 AM - 4:00 PM'},
        {'operatingDay': 'Thursday', 'operatingHour': '9:00 AM - 4:30 PM'},
        {
          'operatingDay': 'Friday',
          'operatingHour': '9:00 AM - 12:30 PM, 2:30 PM - 4:30 PM'
        }
      ]
    },
    {
      'userName': 'Hakim Zul',
      'userAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzv0oZnrK2tzmMpzKG-cHBckqS6hkDhqLMdQ&usqp=CAU',
      'userJobType': 'Machinery Maintenance and Repair Specialist',
      'userAge': '25 Years old',
      'userExperience': '4 years',
      'userAbout':
          'With four years of hands-on experience in fixing and maintaining industrial machinery, Hakim Zul is dedicated to ensuring optimal performance and reliability in machine operations.',
      'userCompanyName': 'MSE Laser',
      'userDescription':
          'Founded in 2002, MSE Industries Sdn Bhd (MSE) is a dynamic company known for its expertise in laser welding and thermal spray solutions. Headquartered in Bandar Pinggiran Subang, Selangor Darul Ehsan, MSE offers reliable and sustainable products and services for critical welding maintenance and integration applications. With subsidiary companies like MSE Lasertech (M) Sdn Bhd, MSE extends its reach both locally and internationally, providing comprehensive consultancy and supply services to various industries, including engineering, oil & gas, and aviation. MSE is committed to delivering innovative solutions and outstanding service to meet the diverse needs of its customers.',
      'userOperatingHours': [
        {'operatingDay': 'Saturday', 'operatingHour': '9:00 AM - 2:30 PM'},
        {'operatingDay': 'Sunday', 'operatingHour': 'Closed'},
        {'operatingDay': 'Monday', 'operatingHour': '9:00 AM - 6:00 PM'},
        {'operatingDay': 'Tuesday', 'operatingHour': '9:00 AM - 6:00 PM'},
        {'operatingDay': 'Wednesday', 'operatingHour': '9:00 AM - 6:00 PM'},
        {'operatingDay': 'Thursday', 'operatingHour': '9:00 AM - 6:00 PM'},
        {'operatingDay': 'Friday', 'operatingHour': '9:00 AM - 6:00 PM'}
      ]
    }
  ];

  List listChip = [
    ['Farmers', false],
    ['Finance', false]
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
        'Consultant',
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
