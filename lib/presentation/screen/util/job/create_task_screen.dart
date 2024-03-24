import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vhack_client/presentation/components/button/text_button.dart';
import 'package:vhack_client/presentation/components/dialog/machine/machine_dialog.dart';
import 'package:vhack_client/presentation/components/dialog/member/member_dialog.dart';
import 'package:vhack_client/presentation/components/dropdown/field_dropdown.dart';
import 'package:vhack_client/presentation/components/textfield/date_textfield.dart';
import 'package:vhack_client/presentation/components/textfield/desc_textfield.dart';
import 'package:vhack_client/presentation/components/textfield/field_textfield.dart';
import 'package:vhack_client/presentation/components/textfield/input_textfield.dart';
import 'package:vhack_client/presentation/screen/bridge_screen.dart';
import 'package:vhack_client/shared/constant/custom_color.dart';
import 'package:vhack_client/shared/constant/custom_snackbar.dart';
import 'package:vhack_client/shared/constant/custom_textstyle.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController tcStartDate = TextEditingController();
  final TextEditingController tcEndDate = TextEditingController();
  final TextEditingController tcDesc = TextEditingController();
  final TextEditingController tcField = TextEditingController();

  List listPriority = [
    ['Low', Colors.green, false],
    ['Medium', Colors.orange, false],
    ['High', Colors.red, false]
  ];

  List listField = [
    ['Field 1', false],
    ['Field 2', false],
    ['Field 3', false],
    ['Field 4', false]
  ];

  String? fieldDefault;

  List<String> fields = [
    'Field 1',
    'Field 2',
    'Field 3',
    'Field 4',
    'Field 5',
    'Field 6',
    'Field 7',
    'Field 8',
    'Field 9',
    'Field 10',
    'Field 11',
    'Field 12',
    'Field 13',
    'Field 14',
    'Field 15',
    'Field 16',
    'Field 17',
    'Field 18',
    'Field 19',
    'Field 20'
  ];

  @override
  void initState() {
    tcStartDate.text == '';
    tcEndDate.text == '';
    super.initState();
  }

  void selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: CustomColor.getSecondaryColor(
                context), // Your custom color here
            colorScheme: ColorScheme.light(
                primary: CustomColor.getSecondaryColor(context)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        tcStartDate.text = formattedDate;
      });
    } else {
      debugPrint('Date Null');
    }
  }

  void selectMember() {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return MemberDialog();
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  void selectMachine() {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return MachineDialog();
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  void priorityTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < listPriority.length; i++) {
        setState(() {
          listPriority[i][2] = false;
        });
      }
      listPriority[index][2] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.getBackgroundColor(context),
        appBar: buildAppBar(),
        body: Column(
          children: [buildContentForm(), buildCreateButton()],
        ));
  }

  AppBar buildAppBar() => AppBar(
        backgroundColor: CustomColor.getSecondaryColor(context),
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          'Create Task',
          style: CustomTextStyle.getTitleStyle(
              context, 18, CustomColor.getWhiteColor(context)),
        ),
      );

  Widget buildContentForm() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildFieldForm(),
            const SizedBox(
              height: 20,
            ),
            buildTaskForm(),
            const SizedBox(
              height: 20,
            ),
            builDate('Due Date', tcStartDate, 'Finish On...'),
            const SizedBox(
              height: 20,
            ),
            buildDescription(),
            const SizedBox(
              height: 20,
            ),
            buildButtonForm(),
            const SizedBox(
              height: 20,
            ),
            buildPriority(),
          ],
        ),
      ),
    );
  }

  Widget buildFieldForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Field Name',
            style: CustomTextStyle.getTitleStyle(
                context, 15, CustomColor.getTertieryColor(context)),
          ),
          const SizedBox(
            height: 10,
          ),
          buildDropDownField()
        ],
      ),
    );
  }

  Widget buildDropDownField() {
    return FieldDropDown(
      fields: fields,
      selectedField: fieldDefault,
      onChanged: (newValue) {
        if (newValue != null) {
          setState(() {
            fieldDefault = newValue;
          });
        }
      },
      tcField: tcField,
    );
  }

  Widget buildTaskForm() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Name',
              style: CustomTextStyle.getTitleStyle(
                  context, 15, CustomColor.getTertieryColor(context)),
            ),
            const SizedBox(
              height: 10,
            ),
            InputTextField(
                tcInput: tcStartDate, tcTitle: 'Task Name', tcIcon: Icons.task)
          ],
        ),
      );

  Widget builDate(
      String dateTitle, TextEditingController tcDate, String hintTextField) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateTitle,
            style: CustomTextStyle.getTitleStyle(
                context, 15, CustomColor.getTertieryColor(context)),
          ),
          const SizedBox(
            height: 10,
          ),
          DateTextField(
            hintTextField: hintTextField,
            tcDate: tcDate,
            onTap: () {
              selectDate();
            },
          ),
        ],
      ),
    );
  }

  Widget buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: CustomTextStyle.getTitleStyle(
                context, 15, CustomColor.getTertieryColor(context)),
          ),
          const SizedBox(
            height: 10,
          ),
          DescTextField(tcDesc: tcDesc),
        ],
      ),
    );
  }

  Widget buildButtonForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextOnlyButton(
              buttonTitle: 'Assign Members',
              onPressed: () {
                selectMember();
              },
              isMain: true,
              borderRadius: 12),
          const SizedBox(
            height: 10,
          ),
          TextOnlyButton(
              buttonTitle: 'Select Machines',
              onPressed: () {
                selectMachine();
              },
              isMain: false,
              borderRadius: 12)
        ],
      ),
    );
  }

  Widget buildPriority() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Priority',
            style: CustomTextStyle.getTitleStyle(
                context, 15, CustomColor.getTertieryColor(context)),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(height: 30, child: buildListPriorityChip())
        ],
      ),
    );
  }

  Widget buildListPriorityChip() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listPriority.length,
      itemBuilder: (context, index) {
        bool isSelected = listPriority[index][2];
        return GestureDetector(
          onTap: () {
            priorityTypeSelected(index);
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: buildPriorityChip(isSelected, index)),
        );
      },
    );
  }

  Widget buildPriorityChip(bool isSelected, int index) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: isSelected ? listPriority[index][1] : Colors.black38),
            color:
                isSelected ? listPriority[index][1].shade200 : Colors.black12),
        child: Center(
            child: Text(
          listPriority[index][0],
          style: CustomTextStyle.getSubTitleStyle(context, 12, Colors.black),
        )));
  }

  Widget buildCreateButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 20, top: 10),
      child: TextOnlyButton(
          buttonTitle: 'Create',
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => BridgeScreen(),
                ),
                (route) => false);
          },
          isMain: true,
          borderRadius: 12),
    );
  }

  Widget buildBottomChip() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
          child: Container(
            width: 48,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ],
    );
  }
}
