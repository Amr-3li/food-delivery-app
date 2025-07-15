import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant/core/icons.dart';

import 'package:restaurant/core/utils/styles.dart';

import 'package:restaurant/features/chat/presentation/cubit/conversation_cubit.dart';

import 'package:restaurant/features/chat/presentation/views/widgets/area_input.dart';
import 'package:restaurant/features/chat/presentation/views/widgets/message_list.dart';

import 'package:svg_flutter/svg.dart';

import 'package:url_launcher/url_launcher.dart';

class ChatScreenChief extends StatefulWidget {
  const ChatScreenChief({super.key, this.conversationId = 7});
  final int conversationId;
  final String userName = "chief";
  final String imageUrl =
      "https://img.freepik.com/free-psd/contact-icon-illustration-isolated_23-2151903337.jpg?semt=ais_hybrid&w=740";
  final String currentUserId = "chief1";
  @override
  State<ChatScreenChief> createState() => _ChatScreenChiefState();
}

class _ChatScreenChiefState extends State<ChatScreenChief> {
  late final FocusNode focusNode;
  late final TextEditingController textController;
  bool showEmojiPicker = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    textController = TextEditingController();
    // Load messages when screen initializes
    context.read<ChatCubit>().getConversationMessages(widget.conversationId);
  }

  @override
  void dispose() {
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.iIcon),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.imageUrl),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Text(
              widget.userName,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppIcons.iCall),
            onPressed: _makePhoneCall,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: MessageList(currentUserId: widget.currentUserId)),
          AreaInput(
            focusNode: focusNode,
            textController: textController,
            showEmojiPicker: showEmojiPicker,
            currentUserId: widget.currentUserId,
            conversationId: widget.conversationId,
            onEmojiToggle: (show) {
              setState(() => showEmojiPicker = show);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall() async {
    final Uri launchUri = Uri(scheme: 'tel', path: '+201009247747');
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }
}
