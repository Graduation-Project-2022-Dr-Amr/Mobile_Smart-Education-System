import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
import '../controller/todo_bloc.dart';
import '../theme.dart';
import 'package:intl/intl.dart' as intl;

import '../model/task.dart';
import '../size_config.dart';
import 'add_task_page.dart';
import '../widgets/button.dart';
import '../widgets/task_tile.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  var _selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (context) => ToDoBloc()..getTasks(),
        child: BlocConsumer<ToDoBloc,AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
    var toDoBloc = ToDoBloc.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("All tasks"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              margin:  EdgeInsets.symmetric(
                  horizontal: 12, vertical: SizeConfig.orientation ==
                  Orientation.landscape
                  ? 0:15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( "Today",style: const TextStyle(//AppLocalizations.of(context)!.today_word,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text(intl.DateFormat.yMMMMd(/*AppLocalizations.of(context)!.language*/).format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ThemeData.fallback().brightness == Brightness.dark? Colors.grey.shade400:Colors.grey,
                        ),),
                    ],
                  ),
                  Button(
                      color: purple,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddTaskPage()));
                      },
                      label:"Add task" /*AppLocalizations.of(context)!.add_task*/),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, bottom: 10,right: 10),
            child: DatePicker(
              DateTime.now(),
              //locale: AppLocalizations.of(context)!.language,
              height: 110,
              width: 65,
              initialSelectedDate: DateTime.now(),
              selectedTextColor: Colors.white,
              selectionColor: purple,
              dayTextStyle: const TextStyle(fontSize: 12, color: Colors.grey),
              monthTextStyle:
              const TextStyle(fontSize: 12, color: Colors.grey),
              dateTextStyle: const TextStyle(color: Colors.grey),
              onDateChange: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
          ),
          toDoBloc.taskList.isEmpty?Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                child: RefreshIndicator(
                  onRefresh: () =>toDoBloc.getTasks(),
                  child: SingleChildScrollView(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: SizeConfig.orientation ==
                          Orientation.landscape
                          ? Axis.horizontal
                          : Axis.vertical,
                      children: [
                        SizeConfig.orientation == Orientation.landscape
                            ? const SizedBox(height: 0)
                            : SizedBox(height: SizeConfig
                            .getProportionateScreenHeight(220.0)),
                        Icon(Icons.add),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "All is done",//'${AppLocalizations.of(context)!.all_done_1}\n${AppLocalizations.of(context)!.all_done_2}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ):Expanded(
            child: RefreshIndicator(
              onRefresh: () =>toDoBloc.getTasks(),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection:
                SizeConfig.orientation == Orientation.landscape
                    ? Axis.horizontal
                    : Axis.vertical,
                itemCount:toDoBloc.taskList.length,
                itemBuilder: (ctx, index) {
                  Task task =toDoBloc.taskList[index];

                  if ((task.repeat == 'Daily' || task.repeat == 'التكرار يوميا') ||
                      task.date ==
                          intl.DateFormat.yMMMMEEEEd().format(_selectedDate) ||
                      ((task.repeat == 'Weekly' || task.repeat == 'التكرار اسبوعيا') && _selectedDate
                          .difference(
                          intl.DateFormat.yMMMMEEEEd().parse(task.date!))
                          .inDays % 7 == 0)

                      || ((task.repeat == 'Monthly' || task.repeat == 'التكرار شهريا') && intl.DateFormat
                          .yMMMMEEEEd()
                          .parse(task.date!)
                          .day == _selectedDate.day)
                  ) {

                    // var date = intl.DateFormat.jm().parse(task.startTime!);
                    // var myTime = intl.DateFormat.jm().format(date);
                    // print('this is date $date');
                    // print('this is my time $myTime');
                    // print('this is 0 ${int.parse(myTime.split(':')[0])}');
                    // print('this is 1 ${int.parse(myTime.split(':')[1].split(' ')[0])}');
                    // NotifyHelper().scheduledNotification(
                    //     context: context,
                    //     hours: int.parse(myTime.split(':')[0]),
                    //     minutes: int.parse(myTime.split(':')[1].split(' ')[0]),
                    //     task: task,
                    //     am: myTime.split(':')[1].split(' ')[1]
                    // );

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        horizontalOffset: 200,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () => _showBottomSheet(context, task,toDoBloc),
                            child: TaskTile(task),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),

        ],
      ),
    );
    })
    );
  }

  _showBottomSheet(BuildContext ctx, Task task,toDoBloc) {
    showModalBottomSheet(context: context, builder: (BuildContext ctx)=>SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 4),
        width: SizeConfig.screenWidth,
        height: 320,
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Flexible(
              child: Container(
                height: 6,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? Colors.grey.shade800
                      : Colors.grey.shade400,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildBottomSheet(
                onTap: () {
                  toDoBloc.markAsCompleted(task:task);
                  Navigator.of(ctx).pop();
                },
                color: Colors.green,
                label: task.isCompleted == 1?"Mark as To Do":"Mark as complete"),//AppLocalizations.of(context)!.assign_to_do:AppLocalizations.of(context)!.complete),
            _buildBottomSheet(
                onTap: () {
                  toDoBloc.deleteTasks(task);
                  Navigator.of(ctx).pop();
                },
                color: Colors.red,
                label: "Delete task"/*AppLocalizations.of(context)!.delete_task*/),
            Divider(
              color: Theme
                  .of(context)
                  .brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              indent: 10,
              endIndent: 10,
            ),
            _buildBottomSheet(
                onTap: () {
                  Navigator.of(ctx).pop();
                },
                color: purple,
                label: "Cancel"/*AppLocalizations.of(context)!.cancel*/),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),);
  }

  _buildBottomSheet({required String label,
    required Function() onTap,
    required Color color,
    bool isClose = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 65,
        width: SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : color,
          border: Border.all(
            width: 2,
            color: isClose
                ? Theme
                .of(context)
                .brightness == Brightness.dark
                ? Colors.grey.shade800
                : Colors.grey.shade200
                : color,
          ),
        ),
        child: Center(
            child: Text(label,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),)),
      ),
    );
  }
}

