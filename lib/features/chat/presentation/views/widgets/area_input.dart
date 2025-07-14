import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/features/chat/presentation/cubit/conversation_cubit.dart';
import 'package:svg_flutter/svg.dart';

class AreaInput extends StatefulWidget {
  const AreaInput({
    super.key,
    required this.focusNode,
    required this.textController,
    required this.showEmojiPicker,
    required this.currentUserId,
    required this.conversationId,
    required this.onEmojiToggle,
  });

  final FocusNode focusNode;
  final TextEditingController textController;
  final bool showEmojiPicker;
  final String currentUserId;
  final int conversationId;
  final Function(bool) onEmojiToggle;

  @override
  State<AreaInput> createState() => _AreaInputState();
}

class _AreaInputState extends State<AreaInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            children: [
              IconButton(
                icon: SvgPicture.asset(AppIcons.iSmile, color: Colors.grey),
                onPressed: () {
                  widget.onEmojiToggle(!widget.showEmojiPicker);
                  if (!widget.showEmojiPicker) {
                    widget.focusNode.requestFocus();
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
              Expanded(
                child: TextField(
                  focusNode: widget.focusNode,
                  controller: widget.textController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your message...',
                    border: InputBorder.none,
                  ),
                  onTap: () {
                    if (widget.showEmojiPicker) {
                      widget.onEmojiToggle(false);
                    }
                  },
                  onSubmitted: (text) => _sendMessage(),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send, color: ColorsHelper.orange),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
        if (widget.showEmojiPicker)
          SizedBox(
            height: 250,
            child: EmojiPicker(
              textEditingController: widget.textController,
              config: Config(
                height: 250,
                emojiViewConfig: const EmojiViewConfig(columns: 7),
                checkPlatformCompatibility: true,
              ),
            ),
          ),
      ],
    );
  }

  void _sendMessage() {
    final content = widget.textController.text.trim();
    if (content.isNotEmpty) {
      context.read<ChatCubit>().sendMessage(widget.conversationId, content);
      widget.textController.clear();
    }
  }
}
