import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';



class AppFullFieldDropDown extends StatelessWidget {
  const AppFullFieldDropDown(
      {super.key,
      this.onChanged,
      this.selectedValue,
      required this.dropDownOptions,
      this.hintText});

  final dynamic selectedValue, onChanged;
  final List<String>? dropDownOptions;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    bool isDark = AppHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
            isExpanded: true,
            value: selectedValue,
            icon:  Icon(Icons.arrow_drop_down, color: isDark? AppColors.white : AppColors.darkGrey),
            // Custom dropdown icon
            decoration: InputDecoration(
                hintText: hintText),
            items: dropDownOptions!.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
            onChanged: onChanged),
      ],
    );
  }
}
