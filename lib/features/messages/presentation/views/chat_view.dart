import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/utils/assets_data.dart';
import 'package:restaurant/features/home/data/models/meal_details_model.dart';
import 'package:restaurant/features/messages/presentation/manger/messages_cubit.dart';
import 'package:restaurant/features/messages/presentation/views/widgets/chat_view_body.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/helper/app_responsive.dart';
import '../../../../core/utils/color_helper.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/styles.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.state});

  final GoRouterState state;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  int? id;
  ChefModel? chefModel;

  @override
  void initState() {
    super.initState();
    if (widget.state.extra != null) {
      if (widget.state.extra is int) {
        id = widget.state.extra as int;
        MessagesCubit.get(context).startChat(id: widget.state.extra as int);
      } else if  (widget.state.extra is ChefModel) {
        chefModel = widget.state.extra as ChefModel;
        MessagesCubit.get(context).startChat(id: chefModel!.conversationId!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              MessagesCubit.get(context).getMessages().then((value) {
                id = null;
                chefModel = null;
                Navigator.pop(context);
              },);
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
            if (cubit.chatModel != null || chefModel != null) {
              return Row(
                children: [
                  Image.asset(
                    AssetsData.assetsChefProfileImage, width: 35, height: 35,),
                  SizedBox(width: 10),
                  Text(cubit.chatModel?.data?.conversation?.chef?.name ?? chefModel?.name ?? '', style: Styles.textStyle18)
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
      body: ChatViewBody(id: id ?? chefModel!.id!),
    );
  }
}
