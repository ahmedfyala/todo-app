import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/firebase/firebase_functions.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/theme/app_styles.dart';

class EditView extends StatefulWidget {
  static const String routName = "EditView";

  EditView({super.key});

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  TextEditingController titleTextFiled = TextEditingController();
  TextEditingController descTextFiled = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    TaskModel? taskModel =
        ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Text("Edit View"),
      ),
      body: Card(
        margin: const EdgeInsets.all(40),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 60),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Edit Task",
                style: AppStyles.lightPoppins70018,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: taskModel.title,
                onChanged: (value) {
                  taskModel.title = value;
                },
                // controller: titleTextFiled,
                decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: taskModel.desc,
                onChanged: (value) {
                  taskModel.desc = value;
                },
                // controller: descTextFiled,
                decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  DateTime? newDate = await chooseDay();

                  if (newDate != null) {
                    taskModel.date = newDate.millisecondsSinceEpoch;
                    setState(() {});
                  }
                },
                child: const InkWell(
                    child: Text(
                  "Select Time",
                )),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                DateFormat.yMd().format(
                  DateUtils.dateOnly(
                    DateTime.fromMillisecondsSinceEpoch(taskModel.date),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseFunctions.updateTask(taskModel);
                  Navigator.pop(context);
                },
                child: const Text("Save Changes"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  chooseDay() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
    return chosenDate;
  }
}