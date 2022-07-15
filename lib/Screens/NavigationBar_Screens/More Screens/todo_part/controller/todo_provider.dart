import 'package:flutter/material.dart';

import '../../../../../shared/Components/commponents.dart';
import '../db/db_helper.dart';
import '../model/task.dart';
import 'package:intl/intl.dart' as intl;

import '../view/all_tasks_screen.dart';

class TodoProvider extends ChangeNotifier{
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
    notifyListeners();
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
    notifyListeners();
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
    notifyListeners();
  }

  int selectedReminder = 5;
  final List<int> reminderList = [5, 10, 15, 20, 25, 30];
  int selectedColorIndex = 0;

  onReminderChanged({String? newValue, context}) {
    FocusScope.of(context).unfocus();
    selectedReminder = int.parse(newValue!);
    notifyListeners();
  }




  ///

  colorSelect({context, index}) {
  FocusScope.of(context).unfocus();

  selectedColorIndex = index;
notifyListeners();
  }



  /// Validate the task data if all is completed
  validate(
      {title,
        note,
        // remind,
        // color,
        // repeat,
        // startTime,
        // endTime,
        // date,
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
      ).then((_) {
        taskList.add(Task(
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
        ));
      });

Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>ToDoScreen()));
      //showSnackBarComponent(text: "Task added successfully", context: context);

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
    notifyListeners();
  }

  void deleteTasks(Task task) async {
    await DbHelper.deleteTask(task);
    taskList.remove(task);
    notifyListeners();
  }

  void deleteAllTasks() async {
    await DbHelper.deleteAllTasks();
    taskList.clear();
    notifyListeners();
  }

  void markAsCompleted({required Task task}) async {
    await DbHelper.updateTask(
        id: task.id!, isCompleted: task.isCompleted == 1 ? 0 : 1);
    task.isCompleted = task.isCompleted == 1 ? 0 : 1;
    notifyListeners();
  }

}