import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vhack_client/presentation/screen/build/history_field_screen.dart';
import 'package:vhack_client/presentation/screen/build/job_screen.dart';
import 'package:vhack_client/presentation/screen/feature/aichat_screen.dart';
import 'package:vhack_client/presentation/screen/feature/analyze_screen.dart';
import 'package:vhack_client/presentation/screen/build/home_screen.dart';
import 'package:vhack_client/presentation/screen/build/pest_screen.dart';
import 'package:vhack_client/presentation/screen/build/profile_screen.dart';
import 'package:vhack_client/presentation/screen/util/field/first_field_screen.dart';

import '../../controller/provider/weather/current/current_bloc.dart';
import '../../controller/provider/weather/daily/daily_bloc.dart';
import '../../controller/provider/weather/hourly/hourly_bloc.dart';
import '../../controller/service/location/location_service.dart';
import '../../model/location_entity.dart';
import '../../shared/constant/custom_color.dart';

class BridgeScreen extends StatefulWidget {
  const BridgeScreen({super.key});

  @override
  State<BridgeScreen> createState() => _BridgeScreenState();
}

class _BridgeScreenState extends State<BridgeScreen> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    HomeScreen(),
    HistoryFieldScreen(),
    JobScreen(),
    ProfileScreen()
  ];

  CurrentBloc currentBloc = CurrentBloc();
  DailyBloc dailyBloc = DailyBloc();
  HourlyBloc hourlyBloc = HourlyBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.getBackgroundColor(context),
      bottomNavigationBar: BuildBottomNavBar(),
      body: _pages[_selectedIndex],
    );
  }

  Widget BuildBottomNavBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: CustomColor.getPrimaryColor(context)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.transparent,
              gap: 8,
              activeColor:
                  CustomColor.getSecondaryColor(context).withOpacity(1),
              color: Colors.grey,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.area_chart_outlined,
                  text: 'Field',
                ),
                GButton(
                  icon: Icons.workspaces_outline,
                  text: 'Job',
                ),
                GButton(
                  icon: Icons.person_2_outlined,
                  text: 'Profile',
                ),
              ]),
        ),
      ),
    );
  }
}
