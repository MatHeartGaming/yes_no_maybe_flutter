import 'package:flutter/material.dart';

class MessageFiedlBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFiedlBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        filled: true,
        hintText: 'End your message with a "??"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.text;
              onValue(textValue);
              textController.clear();
            },
            icon: const Icon(Icons.send_outlined)));

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onTapOutside: (event) => focusNode.unfocus(),
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
