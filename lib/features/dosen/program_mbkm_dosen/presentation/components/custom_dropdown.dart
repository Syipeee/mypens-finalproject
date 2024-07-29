import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatefulWidget {
  final String labelText;
  final IconData prefixIcon;
  final String hintText;
  final List<T> items;
  final T? value;
  final ValueSetter<T?>? onChanged;
  final String Function(T) itemToString;
  final String? error;

  const CustomDropDown({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.prefixIcon,
    required this.itemToString,
    this.error,
  }) : super(key: key);

  @override
  _CustomDropDownState<T> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  String _truncateText(String text) {
    const maxLength = 26; // Maximum length of displayed text
    if (text.length <= maxLength) {
      return text; // Return original text if it's shorter than maxLength
    } else {
      return text.substring(0, maxLength - 1) +
          '..'; // Truncate text and add ellipsis
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey[300] ?? Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: widget.error != null ? Colors.red : Colors.grey,
            width: 2.0,
          ),
        ),
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: Icon(widget.prefixIcon),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        errorText: widget.error,
      ),
      value: widget.value,
      onChanged: widget.onChanged,
      items: widget.items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Tooltip(
            message: widget.itemToString(item),
            child: Text(
              _truncateText(widget.itemToString(item)),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
