import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/assets_data.dart';
import 'package:restaurant/features/messages/presentation/manger/messages_cubit.dart';
import 'package:restaurant/features/messages/presentation/views/widgets/chat_view_body.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/helper/app_responsive.dart';
import '../../../../core/utils/color_helper.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/styles.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.id});

  final int id;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {

  @override
  void initState() {
    super.initState();
    final cubit = MessagesCubit.get(context);
    cubit.getChatPolling(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              radius: 22,
              backgroundColor: ColorsHelper.lightBabyBlue,
              child: SvgPicture.asset(AppIcons.iIcon),
            ),
          ),
        ),
        toolbarHeight: AppResponsive.height(context, value: 80),
        title: BlocBuilder<MessagesCubit, MessagesState>(
          builder: (context, state) {
            final cubit = MessagesCubit.get(context);
            if (cubit.chatModel != null) {
              return Row(
                children: [
                  Image.asset(
                    AssetsData.assetsChefProfileImage, width: 35, height: 35,),
                  SizedBox(width: 10),
                  Text(cubit.chatModel?.data?.conversation?.chef?.name ?? '', style: Styles.textStyle18)
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
      body: ChatViewBody(),
    );
  }
}
