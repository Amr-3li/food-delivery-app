import 'package:flutter/material.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/features/cart/presentation/views/cart.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';
import 'package:restaurant/features/chat/presentation/views/list_chat_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ChatListScreen(),
        );
      },
    );
  }
}
