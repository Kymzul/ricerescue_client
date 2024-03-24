import 'package:flutter/material.dart';
import 'package:vhack_client/presentation/components/button/small_button.dart';
import 'package:vhack_client/presentation/components/card/machine/machine_card.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

class MachineDialog extends StatelessWidget {
  MachineDialog({super.key});
  List<Map<String, dynamic>> machines = [
    {
      'machineID': '1',
      'machineName': 'Tractor',
      'machineURL':
          'https://image.made-in-china.com/202f0j00jAKVUBiRMwzv/4WD-Agricultural-Dump-Truck-Tractor-for-Paddy-Field.webp',
      'machineJob': 'Land Preparation',
      'machineStatus': true
    },
    {
      'machineID': '2',
      'machineName': 'Rotary Tiller',
      'machineURL':
          'https://image.made-in-china.com/2f0j00HsglrUKzscpu/1gqn220-Rotary-Tiller-for-Farm-Tractor-Gear-Drive-Cultivator-Beater-Rotary-Plowing-Tiller-Machine-CE-Orchard-Agriculture-Paddy-Dry-Field-Agricultural-Machinery.webp',
      'machineJob': 'Land Preparation',
      'machineStatus': true
    },
    {
      'machineID': '3',
      'machineName': 'Seeder',
      'machineURL':
          'https://inputs.kalgudi.com/data/p_images/1626153803268.jpeg',
      'machineJob': 'Seeding',
      'machineStatus': true
    },
    {
      'machineID': '4',
      'machineName': 'Transplanter',
      'machineURL':
          'https://5.imimg.com/data5/DS/CW/MY-24923732/4-rows-paddy-transplanter.png',
      'machineJob': 'Transplanting Seedlings',
      'machineStatus': true
    },
    {
      'machineID': '5',
      'machineName': 'Fertilizer Spreader',
      'machineURL':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrtCxk4msAjHrJEJQVx2DhuIxnQYBykMc30Q&usqp=CAUpesticide ',
      'machineJob': 'Fertilizer Application',
      'machineStatus': true
    },
    {
      'machineID': '6',
      'machineName': 'Pesticide Sprayer',
      'machineURL':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGpG_swboYFOc8soiN9w8x2WksY0akXjahmQ&usqp=CAU',
      'machineJob': 'Pest Control',
      'machineStatus': true
    },
    {
      'machineID': '7',
      'machineName': 'Harvester',
      'machineURL':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStb4I6vZHhMaikjt4nAb_r5HLUrZb6--tPw0vz9FsGa1Vpbd9fBBZjbAjXgYQfOu0Lf90&usqp=CAU',
      'machineJob': 'Harvesting',
      'machineStatus': true
    },
    {
      'machineID': '8',
      'machineName': 'Thresher',
      'machineURL':
          'https://bensonagro.com/media/front/images/electric-paddy-thresher.jpg',
      'machineJob': 'Threshing',
      'machineStatus': true
    },
    {
      'machineID': '9',
      'machineName': 'Drying Machine',
      'machineURL':
          'https://sc04.alicdn.com/kf/H60020543632a4be3848904ff904e0696m.jpg',
      'machineJob': 'Grain Drying',
      'machineStatus': true
    },
    {
      'machineID': '10',
      'machineName': 'Rice Mill',
      'machineURL':
          'https://sccgmachinery.com/wp-content/uploads/2021/09/7.png',
      'machineJob': 'Rice Milling',
      'machineStatus': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return buildMachineDialog(context);
  }

  Widget buildMachineDialog(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CustomColor.getPrimaryColor(context)),
        height: 500,
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Machines',
                      style: CustomTextStyle.getTitleStyle(
                          context, 18, CustomColor.getTertieryColor(context))),
                  Text('Select your machine',
                      style: CustomTextStyle.getSubTitleStyle(
                          context, 15, CustomColor.getTertieryColor(context)))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(machines.length, (index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MachineCard(
                          eachMachine: machines[index],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
