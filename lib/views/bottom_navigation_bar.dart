import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase/firebase_functions.dart';
import 'package:todo/provider/login_provider.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/views/login_view.dart';
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
    // String displayName = ModalRoute.of(context)?.settings.arguments as String;
    var pro = Provider.of<LoginProvider>(context);
    print("############ BottomNavigationBarr ${pro.userModel?.userName}");

    return Scaffold(
      backgroundColor: AppColors.backgroundLightColor,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryLightColor,
        toolbarHeight: 90,
        title: Text(
          "Hello ${pro.userModel?.userName}",
          style: const TextStyle(
            color: AppColors.secondaryDarkColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 51,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseFunctions.signOut();

                Navigator.pushNamed(context, LoginScreen.routName);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryLightColor,
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
        color: AppColors.secondaryDarkColor,
        padding: EdgeInsets.zero,
        notchMargin: 9,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.primaryLightColor,
          unselectedItemColor: AppColors.bottomNavigationBarIconColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Icon(
                  Icons.format_list_bulleted,
                  size: 30,
                ),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: AppColors.secondaryDarkColor,
                icon: Icon(
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
