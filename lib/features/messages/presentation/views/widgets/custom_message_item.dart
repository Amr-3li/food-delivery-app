import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_network_image.dart';
import 'package:restaurant/features/messages/data/models/chat_model.dart';
import 'package:restaurant/features/messages/data/repo/messages_repo_implemation.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../manger/messages_cubit.dart';

class CustomMessageItem extends StatelessWidget {
  const CustomMessageItem({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final isCustomer = message.sender?.type == 'customer';
    final isText = message.type == 'text';

    return GestureDetector(
      onLongPress: () async {
        final parentContext = context;
        await showDialog(
          context: parentContext,
          barrierColor: Colors.black.withOpacity(0.2),
          builder: (context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Align(
                alignment: isCustomer
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: isCustomer
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (!isCustomer)
                          Text(
                            message.createdAt ?? '',
                            style: Styles.textStyle12.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: isCustomer
                                  ? ColorsHelper.darkerBabyBlue
                                  : ColorsHelper.lightBabyBlue,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                                bottomLeft: isCustomer
                                    ? Radius.zero
                                    : Radius.circular(40),
                                bottomRight: isCustomer
                                    ? Radius.circular(40)
                                    : Radius.zero,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorsHelper.black.withAlpha(100),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Text(
                              message.content ?? '',
                              style: Styles.textStyle16,
                            ),
                          ),
                        ),

                        if (isCustomer)
                          Text(
                            message.createdAt ?? '',
                            style: Styles.textStyle12.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              parentContext.read<MessagesCubit>().deleteMessage(
                                id: message.id!,
                              );
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(AppIcons.assetsDelete),
                                SizedBox(width: 8),
                                Text(
                                  "Delete",
                                  style: Styles.textStyle16.copyWith(
                                    color: ColorsHelper.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Clipboard.setData(
                                ClipboardData(text: message.content ?? ''),
                              );
                              AppToast.showSuccessToast(
                                'Message copied to clipboard',
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.copy,
                                  color: ColorsHelper.orange,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Copy",
                                  style: Styles.textStyle16.copyWith(
                                    color: ColorsHelper.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Align(
        alignment: isCustomer ? Alignment.centerLeft : Alignment.centerRight,
        child: isText ? Row(
          mainAxisAlignment: isCustomer
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isCustomer)
              Text(
                message.createdAt ?? '',
                style: Styles.textStyle12.copyWith(fontWeight: FontWeight.bold),
              ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                decoration: BoxDecoration(
                  color: isCustomer
                      ? ColorsHelper.darkerBabyBlue
                      : ColorsHelper.lightBabyBlue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                    bottomLeft: isCustomer ? Radius.zero : Radius.circular(40),
                    bottomRight: isCustomer ? Radius.circular(40) : Radius.zero,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsHelper.black.withAlpha(100),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(message.content ?? '', style: Styles.textStyle16),
              ),
            ),
            if (isCustomer)
              Text(
                message.createdAt ?? '',
                style: Styles.textStyle12.copyWith(fontWeight: FontWeight.bold),
              ),
          ],
        ) : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          child: CustomNetworkImage(imageUrl: message.content ?? '', width: 180, height: 160),
        ),
      ),
    );
  }
}
