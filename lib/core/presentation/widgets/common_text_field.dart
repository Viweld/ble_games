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
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);

    // Автопрокрутка при изменении текста
    _controller.addListener(_scrollToCursor);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollToCursor);
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToCursor() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  void didUpdateWidget(CommonTextField oldWidget) {
    _updateInitialText(oldWidget, widget);
    super.didUpdateWidget(oldWidget);
  }

  void _updateInitialText(CommonTextField oldWidget, CommonTextField widget) {
    if (oldWidget.text != widget.text) {
      final oldSelection = _controller.selection.baseOffset;
      final newText = widget.text ?? '';
      final safeOffset = oldSelection.clamp(0, newText.length);

      _controller
        ..text = newText
        ..selection = TextSelection.collapsed(offset: safeOffset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      scrollController: _scrollController,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        errorText: widget.errorText,
        errorMaxLines: 2,
      ),
    );
  }
}
