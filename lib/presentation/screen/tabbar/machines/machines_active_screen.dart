import 'package:flutter/material.dart';

import '../../../../shared/constant/custom_color.dart';
import '../../../components/card/machine/machine_card.dart';
import '../../../components/textfield/search_textfield.dart';

class MachinesActiveScreen extends StatelessWidget {
  List<Map<String, dynamic>> machines;

  MachinesActiveScreen({super.key, required this.machines});

  final TextEditingController tcSearch = TextEditingController();

  final List temp = [true, true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.getBackgroundColor(context),
      body: Column(
        children: [
          buildSearchTextfield(),
          Expanded(
              child: ListView.builder(
            itemCount: machines.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: MachineCard(
                    eachMachine: machines[index],
                  ));
            },
          ))
        ],
      ),
    );
  }

  Widget buildSearchTextfield() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
      child: SearchTextfield(
          title: 'Search your machines',
          onChanged: (p0) {},
          tcSearch: tcSearch),
    );
  }
}
