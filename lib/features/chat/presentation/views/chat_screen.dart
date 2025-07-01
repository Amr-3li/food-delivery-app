import 'package:bubble/bubble.dart';
import 'package:dlibphonenumber/enums/phone_number_format.dart';
import 'package:dlibphonenumber/phone_number_util.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chat/data/models/chat_model.dart';
import 'package:svg_flutter/svg.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static final String kChatView = "chat screen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool showEmojiPicker = false;
  final FocusNode focusNode = FocusNode();
  TextEditingController textController = TextEditingController();

  final List<ChatMessages> messages = [
    ChatMessages(
      idFrom: 'user1',
      idTo: 'user2',
      timestamp: '2024-01-01 10:00:00',
      content: 'Hey, how are you?',
      type: 0,
    ),
    ChatMessages(
      idFrom: 'user2',
      idTo: 'user1',
      timestamp: '2024-01-01 10:01:00',
      content: 'I am good, thank you!',
      type: 0,
    ),
    ChatMessages(
      idFrom: 'user1',
      idTo: 'user2',
      timestamp: '2024-01-01 10:02:00',
      content: 'Great to hear that!',
      type: 0,
    ),
  ];

  final String currentUserId = 'user1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(AppIcons.iIcon),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPDheuafnrCB0q-VE5n3RLRREX5dN3JrdJzJF76tz0y80fP4uNM0ZTtXbXWA-e2yuWKKk&usqp=CAU",
              ),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Text(
              "User name",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                final phoneUtil = PhoneNumberUtil.instance;
                try {
                  final parsedNumber = phoneUtil.parse('01009247747', 'EG');

                  // Format the number to international format (e.g., +233241234567)
                  final formattedNumber = phoneUtil.format(
                    parsedNumber,
                    PhoneNumberFormat.international,
                  );

                  final uri = Uri.parse('tel:$formattedNumber');

                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    print('Could not launch dialer');
                  }
                } catch (e) {
                  print('Invalid number: $e');
                }
              },
              child: SvgPicture.asset(AppIcons.iCall),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: buildMessageList(messages, currentUserId)),
          buildInputArea(),
        ],
      ),
    );
  }

  Widget buildMessageItem(ChatMessages chatMessage, bool isSender) {
    return Bubble(
      margin: const BubbleEdges.only(top: 10),
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      nip: isSender ? BubbleNip.rightTop : BubbleNip.leftTop,
      color: isSender ? ColorsHelper.orange : ColorsHelper.lightBabyBlue,
      child: Text(
        chatMessage.content,
        style: TextStyle(color: isSender ? Colors.white : Colors.black),
      ),
    );
  }

  Widget buildMessageList(List<ChatMessages> messages, String currentUserId) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message =
              messages[messages.length - 1 - index]; // Reverse manually
          final isSender = message.idFrom == currentUserId;
          return buildMessageItem(message, isSender);
        },
      ),
    );
  }

  Widget buildInputArea() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  print(
                    'Emoji button pressed. Current state: $showEmojiPicker',
                  ); // Debug print

                  if (showEmojiPicker) {
                    // Hide emoji picker, show keyboard
                    setState(() {
                      showEmojiPicker = false;
                    });
                    Future.delayed(const Duration(milliseconds: 100), () {
                      focusNode.requestFocus();
                    });
                  } else {
                    // Show emoji picker, hide keyboard
                    FocusScope.of(context).unfocus();
                    Future.delayed(const Duration(milliseconds: 100), () {
                      setState(() {
                        showEmojiPicker = true;
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
                  focusNode: focusNode,
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your message...',
                    border: InputBorder.none,
                  ),
                  onTap: () {
                    if (showEmojiPicker) {
                      setState(() {
                        showEmojiPicker =
                            false; // hide emoji picker when keyboard opens
                      });
                    }
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.send, color: ColorsHelper.orange),
                onPressed: () {
                  final newMessage = textController.text.trim();
                  if (newMessage.isNotEmpty) {
                    final chat = ChatMessages(
                      idFrom: currentUserId,
                      idTo: 'user2',
                      timestamp: DateTime.now().toIso8601String(),
                      content: newMessage,
                      type: 0,
                    );

                    setState(() {
                      messages.add(chat);
                      showEmojiPicker = false;
                    });

                    textController.clear();
                  }
                },
              ),
            ],
          ),
        ),
        if (showEmojiPicker)
          SizedBox(
            height: 250,
            child: EmojiPicker(
              textEditingController: textController,
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
