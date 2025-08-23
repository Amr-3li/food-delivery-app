import 'dart:io';
import 'dart:ui';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/messages/presentation/manger/messages_cubit.dart';
import 'package:svg_flutter/svg.dart';
import 'custom_message_item.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key, required this.id});

  final int id;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showScrollButton = false;
  bool _isFirstTime = true;
  bool _showEmoji = false;
  XFile? image;


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset < _scrollController.position.maxScrollExtent - 100) {
        if (!_showScrollButton) setState(() => _showScrollButton = true);
      } else {
        if (_showScrollButton) setState(() => _showScrollButton = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocConsumer<MessagesCubit, MessagesState>(
          listener: (context, state) {
            if (state is DeleteMessageSuccess) {
              AppToast.showSuccessToast(state.messages);
            } else if (state is DeleteMessageFailure) {
              AppToast.showErrorToast(state.error);
            }
          },
          builder: (context, state) {
            final cubit = MessagesCubit.get(context);
            if (cubit.chatModel != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (_scrollController.hasClients) {
                  if (_isFirstTime) {
                    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                    _isFirstTime = false;
                  }
                }
              });
              return Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      controller: _scrollController,
                      itemBuilder: (context, index) =>
                          CustomMessageItem(message: cubit.chatModel!.data!.conversation!.messages[index]),
                      itemCount: cubit.chatModel!.data!.conversation!.messages.length,
                    ),

                  if (_showScrollButton)
                    Positioned(
                      top: MediaQuery.of(context).size.height / 1.45,
                      left: MediaQuery.of(context).size.width / 2.2,
                      child: FloatingActionButton(
                        shape: CircleBorder(),
                        backgroundColor: ColorsHelper.orange,
                        mini: true,
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Icon(Icons.arrow_downward, color: Colors.white,),
                  ),
                ),
                  ],
                ),
              );
            }
            return Spacer();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onTap: () {
                    if (_showEmoji) {
                      setState(() {
                        _showEmoji = false;
                      });
                    }
                  },
                  controller: _messageController,
                  cursorColor: Colors.orange,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Write your message',
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final parentContext = context;
                          image = await picker.pickImage(source: ImageSource.gallery);

                          if (image != null) {
                            showDialog(
                              context: parentContext,
                              barrierColor: Colors.black.withOpacity(0.2),
                              builder: (context) {
                                return BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 16),
                                        width: double.infinity,
                                        height: AppResponsive.height(context, value: 480),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: FileImage(File(image!.path)), fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () {
                                          if (image != null) {
                                            parentContext.read<MessagesCubit>().sendMessage(
                                              receiverId: widget.id,
                                              image: image,
                                              type: 'image',
                                            );
                                            Navigator.pop(context);
                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                              _scrollController.animateTo(
                                                _scrollController.position.maxScrollExtent,
                                                duration: Duration(milliseconds: 300),
                                                curve: Curves.easeOut,
                                              );
                                            });
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Send',
                                              style: Styles.textStyle16.copyWith(color: Colors.orange),
                                            ),
                                            SizedBox(width: 6,),
                                            SvgPicture.asset(AppIcons.iSend, width: 20 , height: 20 ,color: Colors.orange,),
                                            SizedBox(width: 8,),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                );
                              },
                            );
                          }
                        }, icon: Icon(Icons.image)),
                        IconButton(onPressed: () {
                          FocusScope.of(context).unfocus();
                          Future.delayed(Duration(milliseconds: 250), () {
                            setState(() {
                              _showEmoji = !_showEmoji;
                            });
                          });
                        }, icon: Icon(Icons.emoji_emotions)),
                      ],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: ColorsHelper.lightBabyBlue,
                  ),
                )
              ),
              SizedBox(width: 6),
              TextButton(
                onPressed: () {
                  context.read<MessagesCubit>().sendMessage(
                    receiverId: widget.id,
                    message: _messageController.text,
                    type: 'text',
                  );
                  print('------------------------------------------------------------------id ---------------------------- ${widget.id}');
                  _messageController.clear();
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  });
                },
                child: Text(
                  'Send',
                  style: Styles.textStyle16.copyWith(color: Colors.orange),
                ),
              ),
            ],
          ),
        ),
        if (_showEmoji)
          SizedBox(
            height: 300,
            child: EmojiPicker(
              textEditingController: _messageController,
              config: Config(
                bottomActionBarConfig: BottomActionBarConfig(
                  enabled: false

                ),
                categoryViewConfig: CategoryViewConfig(
                  indicatorColor: Colors.orange,
                  iconColorSelected: Colors.orange
                )
              ),
            ),
          ),
      ],
    );
  }
}
