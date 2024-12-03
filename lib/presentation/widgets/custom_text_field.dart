import 'package:flutter/material.dart';
import '../../config/theme/font_system/app_fonts.dart';
import '../../config/theme/styles_manager.dart';

class CustomTextInputField extends StatelessWidget {
  final String label;
  final int? maxLines;
  final bool autoFocus;
  final Widget? prefix;
  final bool isDisabled;
  final TextInputType type;
  final FormFieldValidator? validator;
  final TextInputAction textInputAction;
  final ValueChanged<String?>? onChanged;
  final TextEditingController? controller;

  const CustomTextInputField({
    super.key,
    this.prefix,
    this.onChanged,
    this.validator,
    this.controller,
    this.maxLines = 1,
    required this.label,
    this.autoFocus = true,
    this.isDisabled = false,
    this.type = TextInputType.text,
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: type,
      autofocus: autoFocus,
      readOnly: isDisabled,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: prefix,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      style: StylesManager.medium(fontSize: AppFonts.font.large),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
