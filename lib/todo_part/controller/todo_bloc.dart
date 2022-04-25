import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/Components/commponents.dart';
import '../db/db_helper.dart';
import '../model/task.dart';
import '../../Logics/StateManagement/Bloc/bloc_states.dart';
import 'package:intl/intl.dart' as intl;

class ToDoBloc extends Cubit<AppStates> {
  ToDoBloc() : super(AppInitialState());

  static ToDoBloc get(context) => BlocProvider.of(context);
  DateTime selectedDate = DateTime.now();
  String endTime = '';
  String startTime = '';

  getDateFromUser({context}) async {
    DateTime? _pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (_pickedDate != null) {
      selectedDate = _pickedDate;
    } else {
      print('It Is Null Or Something Wrong');
    }
    emit(ToDOState());
  }

  getTimeFromUser(
      {required bool isStartTime, required BuildContext ctx}) async {
    var _pickedTime = await _showTimePicker(ctx);
    if (_pickedTime != null) {
      String _formattedTime = _pickedTime.format(ctx);
      print("  _formattedTime :$_formattedTime");

      if (_pickedTime == null) {
        print('Time Canceled');
      } else if (isStartTime) {
        startTime = _formattedTime;
        print(" start Time :$startTime");
      } else {
        endTime = _formattedTime;
      }
    } else {
      return;
    }
    emit(ToDOState());
  }

  _showTimePicker(context) {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: TimeOfDay.now().hour + 1, minute: TimeOfDay.now().minute),
        initialEntryMode: TimePickerEntryMode.dial);
  }

  String selectedRepeat = '';
  final List<String> repeatList = [
    'None',
    'Daily',
    'Weekly',
    'Monthly',
  ];

  onRepeatChanged({String? newValue, context}) {
    FocusScope.of(context).unfocus();
    selectedRepeat = newValue!;
    emit(ToDOState());
  }

  int selectedReminder = 5;
  final List<int> reminderList = [5, 10, 15, 20, 25, 30];
  int selectedColorIndex = 0;

  onReminderChanged({String? newValue, context}) {
    FocusScope.of(context).unfocus();
    selectedReminder = int.parse(newValue!);
    emit(ToDOState());
  }

  /// Validate the task data if all is completed
  validate(
      {title,
      note,
      remind,
      color,
      repeat,
      startTime,
      endTime,
      date,
      context}) async {
    if (title.isNotEmpty && endTime != '' && startTime != '') {
      await addTask(
        task: Task(
          title: title,
          note: note,
          startTime: startTime,
          endTime: endTime,
          date: intl.DateFormat.yMMMMEEEEd().format(selectedDate),
          remind: selectedReminder,
          color: selectedColorIndex,
          repeat: selectedRepeat == '' ? "None" : selectedRepeat,
          //AppLocalizations.of(context)!.none
          isCompleted: 0,
        ),
      );

      taskList.add(Task(
        title: title,
        note: note,
        date: date,
        startTime: startTime,
        endTime: endTime,
        remind: remind,
        color: color,
        repeat: repeat == '' ? "None" : repeat,
        //AppLocalizations.of(context)!.none
        isCompleted: 0,
      ));

      emit(ToDOState());
      showSnackBarComponent(text: "Task added successfully", context: context);
      Navigator.of(context).pop();
    } else {
      showSnackBarComponent(text: "All field required", context: context);
      print("there is a missed data");
    }
  }

  /// local Database methods
  final List<Task> taskList = <Task>[];

  Future<int> addTask({required Task task}) async {
    return await DbHelper.insertTask(task);
  }

  Future<void> getTasks() async {
    final List<Map<String, dynamic>> tasks = await DbHelper.queryTask();
    for (var element in tasks) {
      int isExist = taskList.indexWhere((e) => element["id"] == e.id);

      if (isExist < 0) {
        taskList.add(Task.fromJson(element));
      }
    }
    emit(ToDOState());
  }

  void deleteTasks(Task task) async {
    await DbHelper.deleteTask(task);
    taskList.remove(task);
    emit(ToDOState());
  }

  void deleteAllTasks() async {
    await DbHelper.deleteAllTasks();
    taskList.clear();
    emit(ToDOState());
  }

  void markAsCompleted({required Task task}) async {
    await DbHelper.updateTask(
        id: task.id!, isCompleted: task.isCompleted == 1 ? 0 : 1);
    task.isCompleted = task.isCompleted == 1 ? 0 : 1;
    emit(ToDOState());
  }
}
