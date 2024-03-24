import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vhack_client/presentation/components/button/icon_text_button.dart';
import 'package:vhack_client/presentation/components/button/text_button.dart';
import 'package:vhack_client/presentation/components/card/job/job_card.dart';
import 'package:vhack_client/presentation/components/date/timeline_date.dart';
import 'package:vhack_client/presentation/screen/util/job/plan_job_screen.dart';
import 'package:vhack_client/shared/constant/custom_appbar.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  DateTime? selectedDate;

  List<Map<String, dynamic>> listJob = [
    {'jobIcon': 'assets/job/spray.svg', 'jobTitle': 'Spray Job'},
    {'jobIcon': 'assets/job/fertilizer.svg', 'jobTitle': 'Fertilizer Job'},
    {'jobIcon': 'assets/job/irrigation.svg', 'jobTitle': 'Irrigation Job'},
    {'jobIcon': 'assets/job/harvest.svg', 'jobTitle': 'Harvest Job'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.getBackgroundColor(context),
        floatingActionButton: floatingActionButton(),
        appBar: buildAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: buildHeader(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: buildListWidget(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            buildListJob()
          ],
        ));
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlanJobScreen(),
        ));
      },
      child: Icon(
        Icons.add,
        color: CustomColor.getWhiteColor(context),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: CustomColor.getBackgroundColor(context),
      elevation: 0.5,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        'Job',
        style: CustomTextStyle.getTitleStyle(
            context, 18, CustomColor.getSecondaryColor(context)),
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today',
                    style: CustomTextStyle.getSubTitleStyle(
                        context, 15, CustomColor.getTertieryColor(context)),
                  ),
                  Text(
                    'November 27, 2023',
                    style: CustomTextStyle.getTitleStyle(
                        context, 18, CustomColor.getSecondaryColor(context)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          buildDatePicker()
        ],
      ),
    );
  }

  Widget buildDatePicker() {
    return TimeLineDate(
      onDateChange: (valueDate) {
        selectedDate = valueDate;
      },
    );
  }

  Widget buildListWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: buildWidget('To-do', 24)),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: buildWidget('Completed', 2))
        ],
      ),
    );
  }

  Widget buildWidget(String title, int value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: CustomColor.getPrimaryColor(context),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x3F14181B),
              offset: Offset(0, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTextStyle.getSubTitleStyle(
                context, 15, CustomColor.getTertieryColor(context)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value.toString(),
            style: CustomTextStyle.getTitleStyle(
                context, 32, CustomColor.getSecondaryColor(context)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'You almost there',
            style: CustomTextStyle.getSubTitleStyle(
                context, 12, CustomColor.getTertieryColor(context)),
          ),
        ],
      ),
    );
  }

  Widget buildListJob() {
    return SliverList.builder(
      itemCount: listJob.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> eachJob = listJob[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: JobCard(
            job: eachJob,
          ),
        );
      },
    );
  }
}
