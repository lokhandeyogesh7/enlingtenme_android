import 'package:enlightenme/src/config/utils.dart';
import 'package:enlightenme/src/widgets/app_text_field_rounded.dart';
import 'package:enlightenme/src/widgets/styled_switch.dart';
import 'package:enlightenme/src/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/colors.dart';
import '../../widgets/app_button.dart';
import '../../widgets/sub_titile_text.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _criteriaController = TextEditingController();
  TextEditingController _feesController = TextEditingController();
  bool openToAll = true;
  bool onetoone = true;
  bool zoom = true;
  String selectedDate = Utils.selecteDate;
  String selectTime = Utils.selecteTime;

  DateTime selectedDT = DateTime.now();
  TimeOfDay selectedTM = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDT,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDT) {
      setState(() {
        String formattedDate = DateFormat('dd MMM yyyy').format(picked);
        selectedDate = formattedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
      context: context,
      initialTime: selectedTM,
      builder: (context, childWidget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: childWidget!,
        );
      },
    );

    if (picked_s != null) {
      print('selected time ${picked_s.format(context)}');
      setState(() {
        selectTime = picked_s.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Create Event")),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: AppButton(
          onClick: () {
            Navigator.pop(context);
          },
          title: "Submit",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              AppTextFieldRounded(
                controller: _eventNameController,
                label: "Name",
              ),
              SizedBox(
                height: 15,
              ),
              AppTextFieldRounded(
                controller: _descriptionController,
                label: "Description",
                maxLines: 5,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleText(
                      text: "Open for all",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  StyledSwitch(onToggled: (istoggeld) {
                    openToAll = istoggeld;
                    setState(() {});
                  }),
                ],
              ),
              openToAll
                  ? AppTextFieldRounded(
                      controller: _criteriaController,
                      label: "Criteria",
                      maxLines: 2,
                    )
                  : Container(),
              SizedBox(
                height: 15,
              ),
              AppTextFieldRounded(
                controller: _feesController,
                label: "Fees",
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SubTitleText(
                            text: selectedDate,
                            fontSize: 16,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _selectTime(context);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SubTitleText(
                            text: selectTime,
                            fontSize: 16,
                            color: Colors.black,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: TitleText(
                    text: "Select Event Type",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      onetoone = true;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: onetoone
                              ? Border.all(color: AppColors.dodgerblue)
                              : Border.all(color: AppColors.darkGrey)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.asset("assets/interview.png", width: 60),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SubTitleText(
                                text: "One to One",
                                color: onetoone
                                    ? AppColors.dodgerblue
                                    : AppColors.darkGrey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onetoone = false;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: onetoone
                              ? Border.all(color: AppColors.darkGrey)
                              : Border.all(color: AppColors.dodgerblue)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.asset("assets/webinar.png", width: 60),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SubTitleText(
                                  text: "One to Many",
                                  color: onetoone
                                      ? AppColors.darkGrey
                                      : AppColors.dodgerblue),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: TitleText(
                    text: "Select Platform",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      child: InkWell(
                        onTap: () {
                          zoom = true;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: zoom
                                  ? Border.all(color: AppColors.dodgerblue)
                                  : Border.all(color: AppColors.darkGrey)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset("assets/zoom.png", width: 30),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SubTitleText(
                                    text: "Zoom",
                                    color: zoom
                                        ? AppColors.dodgerblue
                                        : AppColors.darkGrey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 20,
                    ),
                    Container(
                      width: 100,
                      child: InkWell(
                        onTap: () {
                          zoom = false;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: zoom
                                  ? Border.all(color: AppColors.darkGrey)
                                  : Border.all(color: AppColors.dodgerblue)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset("assets/new.png", width: 30),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: SubTitleText(
                                        text: "Meet",
                                        color: zoom
                                            ? AppColors.darkGrey
                                            : AppColors.dodgerblue),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
