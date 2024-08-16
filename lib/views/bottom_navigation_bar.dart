import 'package:flutter/material.dart';
import 'package:todo/widgets/add_task_bottom_sheet.dart';
import 'package:todo/widgets/setting_tab.dart';
import 'package:todo/widgets/tasks_tab.dart';

class BottomNavigationBarr extends StatefulWidget {
  static const String routName = "BottomNavigationBarr";

  const BottomNavigationBarr({super.key});

  @override
  State<BottomNavigationBarr> createState() => _BottomNavigationBarrState();
}

class _BottomNavigationBarrState extends State<BottomNavigationBarr> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String displayName = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Hello $displayName",
        ),
        titleSpacing: 51,
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddTaskBottomSheet(),
            ),
          );
        },
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            35,
          ),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.onSecondary,
        padding: EdgeInsets.zero,
        notchMargin: 9,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.surface,
                icon: const Icon(
                  Icons.format_list_bulleted,
                  size: 30,
                ),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: ''),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [TasksTab(), const SettingTap()];
}
