import 'package:batuga/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/extensions/build_context_extension.dart';
import 'bloc/nickname_bloc.dart';

/// Диалог ввода псевдонима
class NicknameDialog extends StatelessWidget {
  const NicknameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepProvider.of(context).buildNicknameBloc(),
      child: const _NicknameDialogView(),
    );
  }
}

class _NicknameDialogView extends StatefulWidget {
  const _NicknameDialogView();

  @override
  State<_NicknameDialogView> createState() => _NicknameDialogViewState();
}

class _NicknameDialogViewState extends State<_NicknameDialogView> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NicknameBloc, NicknameState>(
      listenWhen: (previous, state) => switch (state) {
        NicknameStateNicknameSaved() => true,
        NicknameStateError() => true,
        _ => false,
      },
      buildWhen: (previous, state) => switch (state) {
        NicknameStateInitial() => true,
        _ => false,
      },
      listener: (context, state) => switch (state) {
        NicknameStateInitial() => null,
        NicknameStateNicknameSaved() => Navigator.of(context).pop(),
        NicknameStateError(:final message) => context.showSnackBar(message),
        NicknameState() => null,
      },
      builder: (context, state) {
        final isEnabled =
            _textController.text.length >= AppConstants.minNicknameLength;
        return AlertDialog(
          title: const Text('Придумайте себе псевдоним'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Псевдоним',
              hintText: 'Введите псевдоним',
            ),
            onChanged: (value) {
              context.read<NicknameBloc>().add(
                NicknameEvent.onNicknameChanged(nick: value),
              );
              setState(() {});
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: isEnabled
                  ? () {
                      context.read<NicknameBloc>().add(
                        NicknameEvent.onSaveNickname(
                          name: _textController.text,
                        ),
                      );
                    }
                  : null,
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }
}
