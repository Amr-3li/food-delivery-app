import 'package:flutter/material.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  final List<Map<String, String>> faqs = const [
    {
      'question': 'How can I reset my password?',
      'answer':
          'Go to Settings > Account > Reset Password and follow the instructions.',
    },
    {
      'question': 'How do I track my order?',
      'answer':
          'You can track your order from the "Orders" section in your profile.',
    },
    {
      'question': 'How do I contact support?',
      'answer':
          'Click on the "Support" section in the app menu or email us at support@example.com.',
    },
    {
      'question': 'How do I update my address?',
      'answer':
          'Navigate to Profile > Addresses and click the edit icon to update your address.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        dynamicText: "FAQs",
        onLeadingPressed: () {
          Navigator.pop(context);
        },
        userImageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPDheuafnrCB0q-VE5n3RLRREX5dN3JrdJzJF76tz0y80fP4uNM0ZTtXbXWA-e2yuWKKk&usqp=CAU", // static or from user
        // title: const Text('FAQs'),
        // centerTitle: true,
        // backgroundColor: Colors.orange,
        // foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 8.h),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: faqs.length,
              separatorBuilder: (_, __) => const Divider(height: 16),
              itemBuilder: (context, index) {
                final faq = faqs[index];
                return ExpansionTile(
                  title: Text(
                    faq['question']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        faq['answer']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
