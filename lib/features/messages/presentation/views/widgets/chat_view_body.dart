import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/messages/presentation/manger/messages_cubit.dart';
import 'custom_message_item.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<MessagesCubit, MessagesState>(
          builder: (context, state) {
            final cubit = MessagesCubit.get(context);
            if (state is GetChatSuccess && cubit.messages.isNotEmpty) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => CustomMessageItem(message: cubit.messages[index]),
                  itemCount: cubit.messages.length,
                ),
              );
            }
            return SizedBox();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    hintText: 'Write your message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: ColorsHelper.lightBabyBlue,
                  ),
                ),
              ),
              SizedBox(width: 6),
              TextButton(onPressed: () {},
                  child: Text('Send',
                    style: Styles.textStyle16.copyWith(color: Colors.orange),))
            ],
          ),
        ),
      ],
    );
  }
}

