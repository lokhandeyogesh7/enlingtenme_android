import 'package:flutter/material.dart';

typedef WidgetBuilder<T> = Widget Function(T? value);

class AppDropDownField<T> extends StatelessWidget {
  const AppDropDownField({
    Key? key,
    required this.data,
    required this.child,
    required this.title,
    required this.onChanged,
    required this.selectedValue,
  }) : super(key: key);

  final List<T>? data;
  final WidgetBuilder child;
  final String title;
  final ValueChanged<T> onChanged;
  final T? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.all(12),
      ),
      hint: Text(
        title,
      ),
      items: data?.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem(
          value: value,
          child: child(value),
        );
      }).toList(),
      isExpanded: true,
      isDense: true,
      onChanged: (value) {
        onChanged(value!);
      },
      value: selectedValue ?? null,
    );
  }
}