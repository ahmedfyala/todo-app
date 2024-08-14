import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/widgets/task_component.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          height: 81,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) => print(date),
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
          child: ListView.builder(
            itemCount: 60,
            itemBuilder: (context, index) {
              return const TaskComponent();
            },
          ),
        ),
      ],
    );
  }
}
