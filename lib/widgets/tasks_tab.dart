import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_functions.dart';
import 'package:todo/widgets/task_component.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          height: 81,
          initialDate: dateTime,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) {
            dateTime = date;
            setState(() {});
          },
          leftMargin: 20,
          monthColor: Theme.of(context).colorScheme.secondary,
          dayColor: Theme.of(context).colorScheme.primary,
          activeDayColor: Theme.of(context).colorScheme.secondary,
          activeBackgroundDayColor: Theme.of(context).colorScheme.primary,
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en',
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFunctions.getTasks(dateTime),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    const Text("Somthing Went Rong"),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Try Again"),
                    )
                  ],
                );
              }
              var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList();

              if (tasks?.isEmpty ?? true) {
                return Text("No Tasks");
              }
              return ListView.builder(
                itemCount: tasks!.length,
                itemBuilder: (context, index) {
                  return TaskComponent(
                    taskModel: tasks[index],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
