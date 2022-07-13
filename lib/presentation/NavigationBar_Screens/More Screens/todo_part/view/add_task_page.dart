import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
import '../controller/todo_provider.dart';
import '../model/task.dart';
import '../size_config.dart';
import '../widgets/button.dart';
import '../widgets/drop_down_box.dart';
import '../widgets/input_field.dart';
import '../widgets/time_box.dart';

import '../theme.dart';

class AddTaskPage extends StatefulWidget {
  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).getTasks();
  }

  @override
  void dispose() async{
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // _repeatList[0] = AppLocalizations.of(context)!.none;
    // _repeatList[1] = AppLocalizations.of(context)!.daily;
    // _repeatList[2] = AppLocalizations.of(context)!.weekly;
    // _repeatList[3] = AppLocalizations.of(context)!.monthly;

    var todoProvider = Provider.of<TodoProvider>(context);
    var todoProviderForMethods = Provider.of<TodoProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async{
        await todoProviderForMethods.getTasks();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "add task", //AppLocalizations.of(context)!.add_task,
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: SizeConfig.screenHeight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InputField(
                      title: "Title",
                      //AppLocalizations.of(context)!.title,
                      hint: "Type task title",
                      //AppLocalizations.of(context)!.title_hint,
                      controller: _titleController),
                  InputField(
                      title: "Note",
                      //AppLocalizations.of(context)!.note,
                      hint: "Type details here",
                      //AppLocalizations.of(context)!.note_hint,
                      controller: _noteController),
                  TimeBox(
                      title: "Date",
                      //AppLocalizations.of(context)!.date,
                      hint: intl.DateFormat.yMMMMEEEEd(
                        /*AppLocalizations.of(context)!.language*/)
                          .format(todoProvider.selectedDate),
                      widget: const Icon(Icons.calendar_today_outlined),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        todoProviderForMethods.getDateFromUser(context: context);
                      }),
                  Row(
                    children: [
                      Expanded(
                        child: TimeBox(
                            title: "Start date",
                            //AppLocalizations.of(context)!.start_date,
                            hint: todoProvider.startTime,
                            widget: const Icon(
                                Icons.access_time_rounded),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              todoProviderForMethods.getTimeFromUser(
                                  isStartTime: true, ctx: context);
                            }

                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TimeBox(
                          title: "End date",
                          //AppLocalizations.of(context)!.end_date,
                          hint: todoProvider.endTime,
                          widget: const Icon(Icons.access_time_rounded),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            todoProviderForMethods.getTimeFromUser(
                                isStartTime: false, ctx: context);
                          },
                        ),
                      ),
                    ],
                  ),
                  DropDownBox(
                      title: "reminder",
                      //AppLocalizations.of(context)!.reminder,
                      widget: DropdownButton(
                        isExpanded: true,
                        hint: Text(
                            '${todoProvider.selectedReminder} early'),
                        //AppLocalizations.of(context)!.early
                        dropdownColor:
                        Theme
                            .of(context)
                            .brightness == Brightness.dark
                            ? Colors.grey.shade800
                            : Colors.grey.shade300,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme
                              .of(context)
                              .brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                        iconSize: 32,
                        underline: Container(height: 0),
                        items: todoProvider.reminderList
                            .map<DropdownMenuItem<String>>((int value) {
                          return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(
                              '${value.toString()} minutes',
                              //AppLocalizations.of(context)!.minutes
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme
                                      .of(context)
                                      .brightness ==
                                      Brightness.dark
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          );
                        }).toList(),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        onChanged: (String? newValue) =>todoProviderForMethods.onReminderChanged(newValue:newValue,context: context),
                        elevation: 5,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  DropDownBox(
                    title: "Repeat",
                    //AppLocalizations.of(context)!.repeat,
                    widget: DropdownButton(
                      hint: Text(todoProvider.selectedRepeat == ''
                          ? "None"
                          : todoProvider.selectedRepeat),
                      //AppLocalizations.of(context)!.none
                      isExpanded: true,
                      dropdownColor:
                      Theme
                          .of(context)
                          .brightness == Brightness.dark
                          ? Colors.grey.shade800
                          : Colors.grey.shade300,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Theme
                            .of(context)
                            .brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                      iconSize: 32,
                      underline: Container(height: 0),
                      items: todoProvider.repeatList
                          .map<DropdownMenuItem<String>>((
                          String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme
                                    .of(context)
                                    .brightness ==
                                    Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        );
                      }).toList(),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      onChanged: (String? newValue)=> todoProviderForMethods.onRepeatChanged(newValue:newValue,context: context),
                      elevation: 5,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Colors",
                            //AppLocalizations.of(context)!.colors,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Wrap(
                            children: List<Widget>.generate(4, (index) {
                              return GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: index == 0
                                        ? purple
                                        : index == 1
                                        ? pink
                                        : index == 2
                                        ? yellow
                                        : green,
                                    child: todoProvider.selectedColorIndex == index
                                        ? const Icon(Icons.done,
                                        color: Colors.white, size: 18)
                                        : Container(),
                                  ),
                                ),
                                onTap:()=>todoProviderForMethods.colorSelect(context:context,index:index),
                              );
                            }),
                          )
                        ],
                      ),
                      Button(
                          color: todoProvider.selectedColorIndex == 0
                              ? purple
                              : todoProvider.selectedColorIndex == 1
                              ? pink
                              : todoProvider.selectedColorIndex == 2
                              ? yellow
                              : green,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            todoProviderForMethods.validate(
                                title
                                    :_titleController.text,
                                note
                                    :_noteController.text,
                                context: context
                            );
                            //todoProviderForMethods.getTasks();
                          },
                          label: "Create task" /*AppLocalizations.of(context)!.create_task*/),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }







}

// String _startTime =  DateFormat.jm(AppLocalizations.of(context)!.language).format(DateTime.now().add(const Duration(hours: 1)));
// String _endTime =  DateFormat.jm(AppLocalizations.of(context)!.language).format(DateTime.now().add(const Duration(hours: 2)));
