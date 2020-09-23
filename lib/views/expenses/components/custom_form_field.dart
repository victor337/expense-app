import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {

  final FocusNode focusNode;
  final String title;
  final String hintText;
  final String initialValue;
  final TextInputAction textInputAction;
  final TextInputType keyBoardType;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final List<TextInputFormatter> formatters;
  final IconData icon;

  const CustomFormField({
    @required this.hintText,
    @required this.title,
    @required this.focusNode,
    @required this.textInputAction,
    @required this.keyBoardType,
    @required this.onChanged,
    @required this.onSubmitted,
    @required this.icon,
    @required this.initialValue,
    this.formatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                title,
              ),
            ],
          ),
          TextFormField(
            initialValue: initialValue,
            cursorColor: Theme.of(context).primaryColor,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            focusNode: focusNode,
            textInputAction: textInputAction,
            keyboardType: keyBoardType,
            inputFormatters: formatters,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder()
            ),
          ),
        ],
      ),
    );
  }
}