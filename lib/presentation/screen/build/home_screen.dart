import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vhack_client/controller/provider/weather/daily/daily_bloc.dart';
import 'package:vhack_client/model/weather_entity.dart';
import 'package:vhack_client/presentation/components/card/home/feature_card.dart';
import 'package:vhack_client/presentation/components/card/home/metric_card.dart';
import 'package:vhack_client/presentation/components/card/user_avatar_card.dart';
import 'package:vhack_client/presentation/components/chart/custom_slider.dart';
import 'package:vhack_client/presentation/components/dropdown/field_dropdown.dart';
import 'package:vhack_client/presentation/components/dropdown/metric_dropdown.dart';
import 'package:vhack_client/presentation/screen/feature/aichat_screen.dart';
import 'package:vhack_client/presentation/screen/feature/analyze_screen.dart';
import 'package:vhack_client/presentation/screen/feature/machines_screen.dart';
import 'package:vhack_client/presentation/screen/feature/pest_detector_screen.dart';
import 'package:vhack_client/presentation/screen/feature/service_screen.dart';
import 'package:vhack_client/presentation/screen/feature/team_screen.dart';
import 'package:vhack_client/presentation/screen/util/metric/fertilization_screen.dart';
import 'package:vhack_client/presentation/screen/util/metric/soil_moisture_screen.dart';
import 'package:vhack_client/presentation/screen/util/metric/soil_temperature_screen.dart';
import 'package:vhack_client/presentation/screen/feature/weather_screen.dart';
import 'package:vhack_client/shared/constant/custom_appbar.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';
import 'package:vhack_client/shared/util/widget_data.dart';

import '../../../controller/service/location/location_service.dart';
import '../../../model/location_entity.dart';
import '../../../shared/constant/custom_date.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DailyBloc dailyBloc = DailyBloc();
  String selectedValue = 'Field 1';
  List<String> values = ['Field 1', 'Field 2', 'Field 3', 'Field 4'];

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  Future<void> getCurrentLocation() async {
    try {
      final location = await LocationService.currentLocation();

      debugPrint('Current Latitude ${location.latitude}');
      debugPrint('Current Longitude ${location.longitude}');

      dailyBloc.add(GenerateDailyEvent(
          locationEntity: LocationEntity(
              latitude: location.latitude, longitude: location.longitude)));
    } catch (e) {
      debugPrint('Error getting location: $e');
    }
  }

  void featureNavigation(String featureID) {
    final Map<String, Widget Function(BuildContext)> featureRoutes = {
      '1': (context) => AnalyzeScreen(),
      '2': (context) => AIChatScreen(),
      '3': (context) => WeatherScreen(),
      '4': (context) => MachinesScreen(),
      '5': (context) => TeamScreen(),
      '6': (context) => ServiceScreen()
    };

    final Widget Function(BuildContext)? selectedRoute =
        featureRoutes[featureID];
    if (selectedRoute != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: selectedRoute));
    }
  }

  void metricNavigation(String metricID) {
    final Map<String, Widget Function(BuildContext)> metricRoutes = {
      '1': (context) => FertilizationScreen(),
      '2': (context) => SoilMoistureScreen(),
      '3': (context) => SoilTemperatureScreen(),
      '4': (context) => FertilizationScreen(),
    };

    final Widget Function(BuildContext)? selectedRoute = metricRoutes[metricID];
    if (selectedRoute != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: selectedRoute));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.getBackgroundColor(context),
      appBar: CustomAppBar.BuildMainAppBar(context, true),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  buildHomeHeader(context),
                  buildDivider(),
                  buildHomeOverallHealth(context),
                ],
              ),
            ),
          ),
          buildSpacer(10.0),
          buildFeatureSection(context),
          buildSpacer(10.0),
          buildMetricSection(context, false),
          buildSpacer(10.0),
          buildMetricSection(context, true),
          buildSpacer(20.0),
          buildWeatherSection(context),
        ],
      ),
    );
  }

  Widget buildHomeHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Irfan Ghapar',
                style: CustomTextStyle.getTitleStyle(
                    context, 18, CustomColor.getTertieryColor(context)),
              ),
              Text(
                'Sungai Petani, Kedah',
                style: CustomTextStyle.getSubTitleStyle(
                    context, 14, CustomColor.getTertieryColor(context)),
              )
            ],
          ),
          const UserAvatarCard(
              userAvatar:
                  'https://firebasestorage.googleapis.com/v0/b/twitter-clone-fullstack.appspot.com/o/users%2Fkymzul%40gmail.com?alt=media&token=f9506b23-8e57-4b07-b90e-37f116fc1563',
              radius: 50)
        ],
      ),
    );
  }

  Widget buildHomeOverallHealth(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey, width: 0.5),
          color: CustomColor.getPrimaryColor(context)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColor.getSecondaryColor(context)),
                child: Center(
                  child: Text(
                    '72',
                    style: CustomTextStyle.getTitleStyle(
                        context, 15, CustomColor.getWhiteColor(context)),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overall Health',
                      style: CustomTextStyle.getTitleStyle(
                          context, 15, CustomColor.getTertieryColor(context)),
                    ),
                    Text(
                      'Based on overall health on paddy score 85 consider good',
                      style: CustomTextStyle.getSubTitleStyle(
                          context, 12, CustomColor.getTertieryColor(context)),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildFeatureSection(BuildContext context) {
    return SliverGrid(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final eachFeature = WidgetData.listFeatures[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: FeatureCard(
              eachFeature: eachFeature,
              onPressed: () {
                featureNavigation(eachFeature['featureID']);
              },
            ),
          ),
        );
      }, childCount: WidgetData.listFeatures.length),
    );
  }

  Widget buildMetricSection(BuildContext context, bool isMetrics) {
    if (!isMetrics) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Metrics',
                style: CustomTextStyle.getTitleStyle(
                  context,
                  18,
                  CustomColor.getTertieryColor(context),
                ),
              ),
              MetricDropdown(
                values: values,
                selectedValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              )
            ],
          ),
        ),
      );
    } else {
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          final eachMetric = WidgetData.listMetric[index];
          return InkWell(
            onTap: () {
              metricNavigation(eachMetric['metricID']);
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: MetricCard(eachMetric: eachMetric)),
          );
        }, childCount: WidgetData.listMetric.length),
      );
    }
  }

  Widget buildWeatherSection(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Today Weather',
                      style: CustomTextStyle.getTitleStyle(
                          context, 18, CustomColor.getTertieryColor(context)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WeatherScreen(),
                        ));
                      },
                      child: Text(
                        'More',
                        style: CustomTextStyle.getTitleStyle(context, 15,
                            CustomColor.getSecondaryColor(context)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                buildListWeatherSectionCard()
              ],
            )));
  }

  Widget buildListWeatherSectionCard() {
    return BlocConsumer<DailyBloc, DailyState>(
      bloc: dailyBloc,
      builder: (context, state) {
        if (state is DailyLoaded) {
          if (state.dailys.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                    color: CustomColor.getPrimaryColor(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildWeatherSectionCard(state.dailys[0]),
                    buildWeatherSectionCard(state.dailys[1]),
                    buildWeatherSectionCard(state.dailys[2])
                  ],
                ),
              ),
            );
          } else {
            Text(state.dailys.length.toString());
          }
        }
        if (state is DailyFailure) {
          return Container();
        }
        return Container();
      },
      listener: (context, state) {},
    );
  }

  Widget buildWeatherSectionCard(WeatherEntity weatherEntity) {
    return Expanded(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
          'assets/weather/cloud-sun.svg',
          semanticsLabel: 'Cloud-Sun',
          height: 40,
          width: 40,
        ),
        title: Text(
          ConvertDate.convertToDateWeather(weatherEntity: weatherEntity),
          style: CustomTextStyle.getSubTitleStyle(
              context, 10, CustomColor.getTertieryColor(context)),
        ),
        subtitle: Text(
          '${weatherEntity.weatherTemp!.toString()} C',
          style: CustomTextStyle.getTitleStyle(
              context, 15, CustomColor.getTertieryColor(context)),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Divider(
        color: Colors.grey,
        thickness: 0.5,
      ),
    );
  }

  Widget buildSpacer(double gap) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: gap,
      ),
    );
  }
}
