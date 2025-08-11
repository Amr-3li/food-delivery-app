import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/assets_data.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/messages/presentation/views/widgets/custom_message_info.dart';

import '../../manger/messages_cubit.dart';

class MessagesViewBody extends StatelessWidget {
  const MessagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesCubit, MessagesState>(
      builder: (context, state) {
        final messagesCubit = MessagesCubit.get(context);
        if (messagesCubit.messagesModel != null) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) => CustomMessageInfo(conversation: messagesCubit.messagesModel!.data!.conversations[index],),
            separatorBuilder: (context, index) => SizedBox(height: 30),
            itemCount: messagesCubit.messagesModel!.data!.conversations.length,
          );
        } else if (messagesCubit.messagesModel == null && state is GetMessagesSuccess) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppIcons.assetsNoMessage, width: 150, height: 150,),
                SizedBox(height: 20),
                Text('No Messages Found', style: Styles.textStyle16,),
              ],
            ),
          );
        }
        return LinearProgressIndicator(color: Colors.orange,);
      },
    );
  }
}

