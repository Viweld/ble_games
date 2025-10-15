import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    this.text,
    this.labelText,
    this.hintText,
    this.errorText,
    this.onChanged,
    super.key,
  });

  /// Исходный текст, который будет отображаться в поле ввода при его инициализации
  final String? text;

  /// Название поля
  final String? labelText;

  /// Подсказка для ввода текста в поле ввода
  final String? hintText;

  /// Текст ошибки, который будет отображаться, если введенное значение недопустимо
  final String? errorText;

  /// Обратный вызов, который будет вызываться при изменении текста в поле ввода (срабатывает при изменении каждого символа)
  final Function(String)? onChanged;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  void didUpdateWidget(CommonTextField oldWidget) {
    _updateInitialText(oldWidget, widget);
    super.didUpdateWidget(oldWidget);
  }

  void _updateInitialText(CommonTextField oldWidget, CommonTextField widget) {
    if (oldWidget.text != widget.text) {
      final selection = _controller.selection.baseOffset;
      _controller
        ..text = widget.text ?? ''
        ..selection = TextSelection.collapsed(offset: selection);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        errorText: widget.errorText,
      ),
    );
  }
}
