import 'package:batuga/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_extension.dart';
import '../../../../../core/presentation/widgets/common_text_field.dart';
import 'bloc/nickname_bloc.dart';

/// Диалог ввода псевдонима
class NicknameDialog extends StatelessWidget {
  const NicknameDialog._();

  static Future<bool?> show(BuildContext context) => showDialog<bool?>(
    context: context,
    barrierDismissible: true,
    builder: (context) => const NicknameDialog._(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepProvider.of(context).buildNicknameBloc(),
      child: BlocConsumer<NicknameBloc, NicknameState>(
        listenWhen: (previous, state) => switch (state) {
          NicknameStateNicknameSaved() => true,
          NicknameStateError() => true,
          _ => false,
        },
        buildWhen: (previous, state) => switch (state) {
          NicknameStateView() => true,
          _ => false,
        },
        listener: (context, state) => switch (state) {
          NicknameStateNicknameSaved() => Navigator.pop(context, true),
          NicknameStateError(:final message) => context.showSnackBar(message),
          NicknameState() => null,
        },
        builder: (context, state) {
          if (state is! NicknameStateView) {
            throw UnsupportedError('');
          }
          return AlertDialog(
            title: const Text('Придумайте себе псевдоним'),
            content: CommonTextField(
              text: state.nickName,
              labelText: 'Псевдоним',
              hintText: 'Введите псевдоним',
              errorText: _getErrorText(context, state.nickNameValidationState),
              onChanged: (v) => _onNickNameChanged(context, v),
            ),
            actions: [
              ElevatedButton(
                onPressed: state.isSaveButtonEnabled
                    ? () => _onSaveTapped(context)
                    : null,
                child: const Text('Сохранить'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onNickNameChanged(BuildContext context, String value) {
    context.read<NicknameBloc>().add(
      NicknameEvent.onNicknameChanged(nick: value),
    );
  }

  void _onSaveTapped(BuildContext context) {
    context.read<NicknameBloc>().add(const NicknameEvent.onSaveNickname());
  }

  String? _getErrorText(
    BuildContext context,
    NickNameValidationState? nickNameValidationState,
  ) {
    return switch (nickNameValidationState) {
      NickNameValidationState.empty => 'Псевдоним не должен быть пустым',
      NickNameValidationState.tooLong =>
        'Псевдоним не должен быть длиннее 20 символов',
      NickNameValidationState.wrongFormat =>
        'Не допускаются пробелы между символами',
      _ => null,
    };
  }
}
