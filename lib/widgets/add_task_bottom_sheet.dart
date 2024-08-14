import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({
    super.key,
  });

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
              // controller: ,
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
              // controller: ,
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
            Text(
              "12/8/2030",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
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
                onPressed: () {},
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
}
