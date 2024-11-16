import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String labelText;
  final List<DropdownMenuItem<T>> items;
  final T? selectedValue;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;

  const CustomDropdown({
    Key? key,
    required this.labelText,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.green.shade900, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.green.shade900, width: 1),
        ),
      ),
      value: selectedValue,
      items: items,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
