import 'package:flutter/material.dart';
import 'package:kun_rejasi/constants/app_colors.dart';
import 'package:kun_rejasi/model/tasks.dart';

class Catigoriy extends StatefulWidget {
  const Catigoriy({Key? key}) : super(key: key);

  @override
  State<Catigoriy> createState() => _CatigoriyState();
}

class _CatigoriyState extends State<Catigoriy> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 5,
        runSpacing: 8,
        children: List.generate(CategoryTask.topics.length, (index) {
          var category = CategoryTask.topics[index];
          return ChoiceChip(
            padding: const EdgeInsets.all(16),
            selectedColor: AppColors.lightbottomGradient,
            disabledColor: AppColors.lightNoSelectColor,
            backgroundColor: AppColors.lightNoSelectColor,
            labelStyle: TextStyle(
                color: category.isSelected ? Colors.white : Colors.black),
            label: Text(category.title),
            selected: category.isSelected,
            onSelected: (value) {
              setState(() {
                category.isSelected = !category.isSelected;
              });
            },
          );
        }));
  }
}
