import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/features/chat/data/models/chat_model.dart';
import 'package:svg_flutter/svg.dart';

// ignore: must_be_immutable
class AreaInput extends StatefulWidget {
  AreaInput({
    super.key,
    required this.focusNode,
    required this.textController,
    required this.showEmojiPicker,
    required this.currentUserId,
    required this.messages,
  });
  bool showEmojiPicker;
  final FocusNode focusNode;
  final TextEditingController textController;
  final String currentUserId;
  final List<ChatMessages> messages;
  @override
  State<AreaInput> createState() => _AreaInputState();
}

class _AreaInputState extends State<AreaInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  debugPrint(
                    'Emoji button pressed. Current state: ${widget.showEmojiPicker}',
                  ); // Debug print

                  if (widget.showEmojiPicker) {
                    // Hide emoji picker, show keyboard
                    setState(() {
                      widget.showEmojiPicker = false;
                    });
                    Future.delayed(const Duration(milliseconds: 100), () {
                      widget.focusNode.requestFocus();
                    });
                  } else {
                    // Show emoji picker, hide keyboard
                    FocusScope.of(context).unfocus();
                    Future.delayed(const Duration(milliseconds: 100), () {
                      setState(() {
                        widget.showEmojiPicker = true;
                      });
                    });
                  }
                },
                icon: SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'assets/icons/smile.svg',
                    width: 24,
                    height: 24,
                    color: Colors.grey,
                    fit: BoxFit.contain,
                    placeholderBuilder: (context) =>
                        Icon(Icons.emoji_emotions, color: Colors.grey),
                  ),
                ),
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
                      setState(() {
                        widget.showEmojiPicker =
                            false; // hide emoji picker when keyboard opens
                      });
                    }
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.send, color: ColorsHelper.orange),
                onPressed: () {
                  final newMessage = widget.textController.text.trim();
                  if (newMessage.isNotEmpty) {
                    final chat = ChatMessages(
                      idFrom: widget.currentUserId,
                      idTo: 'user2',
                      timestamp: DateTime.now().toIso8601String(),
                      content: newMessage,
                      type: 0,
                    );

                    setState(() {
                      widget.messages.add(chat);
                      widget.showEmojiPicker = false;
                    });

                    widget.textController.clear();
                  }
                },
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
                checkPlatformCompatibility: true,
                emojiViewConfig: EmojiViewConfig(
                  emojiSizeMax:
                      28 *
                      (foundation.defaultTargetPlatform == TargetPlatform.iOS
                          ? 1.20
                          : 1.0),
                  columns: 7,
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  gridPadding: EdgeInsets.zero,
                  // initCategory: Category.RECENT,
                ),
                viewOrderConfig: const ViewOrderConfig(
                  top: EmojiPickerItem.categoryBar,
                  middle: EmojiPickerItem.emojiView,
                  bottom: EmojiPickerItem.searchBar,
                ),
                skinToneConfig: const SkinToneConfig(),
                categoryViewConfig: const CategoryViewConfig(),
                bottomActionBarConfig: const BottomActionBarConfig(),
                searchViewConfig: const SearchViewConfig(),
              ),
            ),
          ),
      ],
    );
  }
}
