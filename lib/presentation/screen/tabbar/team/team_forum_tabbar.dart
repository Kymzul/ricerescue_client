import 'package:flutter/material.dart';
import 'package:vhack_client/presentation/components/card/team/team_forum_card.dart';
import 'package:vhack_client/presentation/components/card/user_avatar_card.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_string.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

class TeamForumTabbar extends StatelessWidget {
  TeamForumTabbar({super.key});

  List<Map<String, dynamic>> listForum = [
    {
      'userID': '1',
      'userName': 'Hakim',
      'userAvatar':
          'https://media.istockphoto.com/id/1476170969/photo/portrait-of-young-man-ready-for-job-business-concept.webp?b=1&s=170667a&w=0&k=20&c=FycdXoKn5StpYCKJ7PdkyJo9G5wfNgmSLBWk3dI35Zw=',
      'messageContent':
          'Today, I started transplanting the seedlings into the main field. The weather has been cooperative, and the soil moisture seems adequate for planting. Hoping for a successful growing season!',
      'messageAt': '10:30 PM',
      'userFrom': 'Penang, Malaysia'
    },
    {
      'userID': '2',
      'userName': 'Haris Azhari',
      'userAvatar':
          'https://img.freepik.com/free-photo/cute-smiling-young-man-with-bristle-looking-satisfied_176420-18989.jpg',
      'messageContent':
          'Checked on my paddy fields today and noticed some signs of nutrient deficiency in a few areas. Planning to conduct soil tests tomorrow to determine the appropriate fertilization strategy. Anyone else facing similar issues?',
      'messageAt': '6:30 PM',
      'userFrom': 'Penang, Malaysia'
    },
    {
      'userID': '3',
      'userName': 'Zaharudin Hamid',
      'userAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkqKfqsbd-YbQMjHuukKhJZ028SG2T9I5FjNw7GEefcLQc_b40Kw27bOkpV2GInDoKdrU&usqp=CAU',
      'messageContent':
          'Been dealing with stubborn pests attacking my paddy plants lately. Tried various pest control methods, but they seem relentless. Any advice on effective pest management strategies?',
      'messageAt': '3:47 PM',
      'userFrom': 'Kedah, Malaysia'
    },
    {
      'userID': '4',
      'userName': 'Tan Dylan',
      'userAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMmTq0EkraPmBTgQPcd7ykHOd5PPF7R1CLjlkRPFQj9Pw_RHY-zsm6UwURYlNi2oCVZzk&usqp=CAU',
      'messageContent':
          'Harvested my first batch of paddy today, and I couldn\'t be happier with the yield! The hard work throughout the season has paid off. Ready to start the drying process and prepare for the next planting cycle.',
      'messageAt': '1:32 PM',
      'userFrom': 'Serdang, Malaysia'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return buildListForum();
  }

  Widget buildListForum() {
    return ListView.builder(
      itemCount: listForum.length,
      itemBuilder: (context, index) {
        return buildTeamForumCard(listForum[index]);
      },
    );
  }

  Widget buildTeamForumCard(Map<String, dynamic> eachForum) {
    return Column(
      children: [
        TeamForumCard(
          eachForum: eachForum,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        )
      ],
    );
  }
}
