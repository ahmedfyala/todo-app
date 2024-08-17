import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_functions.dart';
import 'package:todo/model/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({
    super.key,
  });

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController titleTextFiled = TextEditingController();

  TextEditingController descTextFiled = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add New Task",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.blue),
            ),
            const SizedBox(
              height: 18,
            ),
            TextField(
              controller: titleTextFiled,
              decoration: InputDecoration(
                labelText: "Title",
                // labelStyle: Theme.of(context).textTheme.titleMedium,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                // focusedBorder: ,
                // enabledBorder: ,
                // errorBorder: ,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: descTextFiled,
              decoration: InputDecoration(
                labelText: "Description",
                // labelStyle: Theme.of(context).textTheme.titleMedium,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                // focusedBorder: ,
                // enabledBorder: ,
                // errorBorder: ,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Select Date",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                chooseDay();
              },
              child: Text(
                selectedDate.toString().substring(0, 10),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  TaskModel taskModel = TaskModel(
                    userId: FirebaseAuth.instance.currentUser?.uid ?? "",
                    title: titleTextFiled.text,
                    desc: descTextFiled.text,
                    date:
                        DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
                  );
                  FirebaseFunctions.addTask(taskModel);
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void chooseDay() async {
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
  }
}
