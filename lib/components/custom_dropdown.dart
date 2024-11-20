import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String labelText;
  final List<DropdownMenuItem<T>> items;
  final T? selectedValue;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;

  const CustomDropdown({
    super.key,
    required this.labelText,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.green.shade900, fontSize: 16),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.green.shade900, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.green.shade900, width: 1.5),
        ),
      ),
      value: selectedValue,
      dropdownColor: Colors.green.shade50, // Set dropdown background color
      items: items.map((DropdownMenuItem<T> item) {
        return DropdownMenuItem<T>(
          value: item.value,
          child: item.child,
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
