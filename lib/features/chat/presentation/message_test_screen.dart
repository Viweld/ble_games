// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../core/domain/models/messages.dart';
// import '../../../../../core/domain/models/user.dart';
// import '../bloc/home_bloc.dart';
//
// /// Экран для тестирования обмена сообщениями через Bluetooth
// class MessageTestScreen extends StatefulWidget {
//   const MessageTestScreen({super.key});
//
//   @override
//   State<MessageTestScreen> createState() => _MessageTestScreenState();
// }
//
// class _MessageTestScreenState extends State<MessageTestScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<Map<String, dynamic>> _messages = [];
//   User? _connectedUser;
//
//   @override
//   void initState() {
//     super.initState();
//     // Инициализируем тестовое имя пользователя
//     _connectedUser = const User(id: 'test_user', name: 'Тестовый пользователь');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('[DEBUG] MessageTestScreen.build() вызван');
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Тест обмена сообщениями'),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: BlocConsumer<HomeBloc, HomeState>(
//         listenWhen: (previous, state) {
//           final shouldListen = switch (state) {
//             HomeStateMessageReceived() => true,
//             HomeStateMessageSent() => true,
//             HomeStateConnectionError() => true,
//             _ => false,
//           };
//           print(
//             '[DEBUG] MessageTestScreen.listenWhen: previous=${previous.runtimeType}, state=${state.runtimeType}, result=$shouldListen',
//           );
//           return shouldListen;
//         },
//         buildWhen: (previous, state) {
//           final shouldBuild = switch (state) {
//             HomeStateMessageTestView() => true,
//             HomeStateConnectionError() => true,
//             _ => false,
//           };
//           print(
//             '[DEBUG] MessageTestScreen.buildWhen: previous=${previous.runtimeType}, state=${state.runtimeType}, result=$shouldBuild',
//           );
//           return shouldBuild;
//         },
//         listener: (context, state) {
//           print(
//             '[DEBUG] MessageTestScreen.listener: state=${state.runtimeType}',
//           );
//           return switch (state) {
//             HomeStateMessageReceived(:final message) => _onMessageReceived(
//               message,
//             ),
//             HomeStateMessageSent() => _onMessageSent(),
//             HomeStateConnectionError(:final message) => _showErrorDialog(
//               message,
//             ),
//             _ => null,
//           };
//         },
//         builder: (context, state) {
//           print(
//             '[DEBUG] MessageTestScreen.builder: state=${state.runtimeType}',
//           );
//
//           return switch (state) {
//             HomeStateMessageTestView() => _MessageTestView(
//               messages: _messages,
//               messageController: _messageController,
//               onSendPressed: _sendMessage,
//             ),
//             HomeStateConnectionError(:final message) => _ErrorView(
//               message: message,
//               onRetry: () {
//                 // Возвращаемся к тестовому экрану
//                 Navigator.of(context).pop();
//               },
//             ),
//             _ => const Center(child: CommonProgressIndicator()),
//           };
//         },
//       ),
//     );
//   }
//
//   /// Обработчик получения сообщения
//   void _onMessageReceived(Message message) {
//     setState(() {
//       _messages.add({
//         'type': 'received',
//         'content': _getMessageContent(message),
//         'timestamp': DateTime.now(),
//       });
//     });
//   }
//
//   /// Обработчик отправки сообщения
//   void _onMessageSent() {
//     setState(() {
//       _messages.add({
//         'type': 'sent',
//         'content': _messageController.text,
//         'timestamp': DateTime.now(),
//       });
//       _messageController.clear();
//     });
//   }
//
//   /// Показать диалог ошибки
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Ошибка соединения'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text('Закрыть'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Отправить сообщение
//   void _sendMessage() {
//     print('[DEBUG] Отправка сообщения: ${_messageController.text.trim()}');
//
//     if (_messageController.text.trim().isNotEmpty) {
//       // Отправляем тестовое сообщение
//       final message = _messageController.text.trim();
//       print('[DEBUG] Добавление события onSendMessage в HomeBloc');
//       context.read<HomeBloc>().add(HomeEvent.onSendMessage(content: message));
//     } else {
//       print('[DEBUG] Пустое сообщение, отправка отменена');
//     }
//   }
//
//   /// Получить содержимое сообщения в строковом виде
//   String _getMessageContent(Message message) {
//     return switch (message) {
//       InvitationMessage() => 'Приглашение к подключению',
//       AcceptanceMessage() => 'Принятие подключения',
//       RejectionMessage() => 'Отказ от подключения',
//       TerminationMessage() => 'Прекращение соединения',
//       MoveMessage() => 'Ход в игре',
//       RoleAssignmentMessage() => 'Назначение роли',
//       OpponentLeftMessage() => 'Соперник вышел',
//       _ => 'Неизвестное сообщение',
//     };
//   }
//
//   @override
//   void dispose() {
//     _messageController.dispose();
//     super.dispose();
//   }
// }
//
// /// Вид для тестирования сообщений
// class _MessageTestView extends StatelessWidget {
//   const _MessageTestView({
//     required this.messages,
//     required this.messageController,
//     required this.onSendPressed,
//   });
//
//   final List<Map<String, dynamic>> messages;
//   final TextEditingController messageController;
//   final VoidCallback onSendPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         /// Область отображения сообщений
//         Expanded(
//           child: messages.isEmpty
//               ? const Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.message, size: 64, color: Colors.grey),
//                       SizedBox(height: 16),
//                       Text(
//                         'Сообщений пока нет',
//                         style: TextStyle(fontSize: 16, color: Colors.grey),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Введите сообщение и нажмите "Отправить"',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 12, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 )
//               : ListView.builder(
//                   padding: const EdgeInsets.all(16),
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     final message = messages[index];
//                     final isSent = message['type'] == 'sent';
//                     final content = message['content'];
//                     final timestamp = message['timestamp'] as DateTime;
//
//                     return _MessageBubble(
//                       content: content,
//                       isSent: isSent,
//                       timestamp: timestamp,
//                     );
//                   },
//                 ),
//         ),
//
//         /// Поле ввода и кнопка отправки
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             children: [
//               /// Поле ввода
//               Expanded(
//                 child: TextField(
//                   controller: messageController,
//                   decoration: const InputDecoration(
//                     hintText: 'Введите сообщение...',
//                     border: OutlineInputBorder(),
//                   ),
//                   onSubmitted: (_) => onSendPressed(),
//                 ),
//               ),
//               const SizedBox(width: 8),
//
//               /// Кнопка отправки
//               IconButton(
//                 icon: const Icon(Icons.send, color: Colors.blue),
//                 onPressed: onSendPressed,
//                 iconSize: 32,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// /// Виджет пузырька сообщения
// class _MessageBubble extends StatelessWidget {
//   const _MessageBubble({
//     required this.content,
//     required this.isSent,
//     required this.timestamp,
//   });
//
//   final String content;
//   final bool isSent;
//   final DateTime timestamp;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: isSent ? Colors.blue : Colors.grey[300],
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           crossAxisAlignment: isSent
//               ? CrossAxisAlignment.end
//               : CrossAxisAlignment.start,
//           children: [
//             /// Текст сообщения
//             Text(
//               content,
//               style: TextStyle(color: isSent ? Colors.white : Colors.black),
//             ),
//             const SizedBox(height: 4),
//
//             /// Временная метка
//             Text(
//               '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}',
//               style: TextStyle(
//                 fontSize: 10,
//                 color: isSent ? Colors.white70 : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// /// Вид ошибки
// class _ErrorView extends StatelessWidget {
//   const _ErrorView({required this.message, required this.onRetry});
//
//   final String message;
//   final VoidCallback onRetry;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.error, size: 64, color: Colors.red),
//             const SizedBox(height: 16),
//             Text(message, textAlign: TextAlign.center),
//             const SizedBox(height: 24),
//             ElevatedButton(onPressed: onRetry, child: const Text('Назад')),
//             const SizedBox(height: 12),
//             TextButton(
//               onPressed: () {
//                 // Отключаемся и возвращаемся к начальному экрану
//                 Navigator.of(context).popUntil((route) => route.isFirst);
//               },
//               child: const Text('Переподключиться'),
//             ),
//             const SizedBox(height: 12),
//             const Text(
//               'При ошибке статуса 133 необходимо полностью отключиться и заново подключиться к устройству.',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 12, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
