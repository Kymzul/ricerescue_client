import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/constant/custom_color.dart';
import '../../../../shared/constant/custom_textstyle.dart';

class JobCard extends StatelessWidget {
  final Map<String, dynamic> job;
  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return buildJobCard(context);
  }

  Widget buildJobCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.getPrimaryColor(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 0.5),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x3F14181B),
            offset: Offset(0, 3),
          )
        ],
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          job['jobIcon'],
          semanticsLabel: job['jobTitle'],
          height: 40,
          width: 40,
        ),
        title: Text(
          job['jobTitle'],
          style: CustomTextStyle.getTitleStyle(
              context, 15, CustomColor.getTertieryColor(context)),
        ),
        subtitle: Text(
          'Alif Teega, Waji',
          style: CustomTextStyle.getSubTitleStyle(
              context, 12, CustomColor.getTertieryColor(context)),
        ),
        trailing: Text(
          '8:00 a.m.',
          style: CustomTextStyle.getTitleStyle(
              context, 15, CustomColor.getSecondaryColor(context)),
        ),
      ),
    );
  }
}
