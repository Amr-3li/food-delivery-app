import 'package:flutter/material.dart';

class FaqsViewBody extends StatelessWidget {
  const FaqsViewBody({super.key});

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
    {
      'question': 'Can I cancel my order after placing it?',
      'answer':
          'Yes, you can cancel your order within 1 hour of placing it from the "Orders" section.',
    },
    {
      'question': 'What payment methods are accepted?',
      'answer':
          'We accept credit cards, debit cards, PayPal, and cash on delivery in select regions.',
    },
    {
      'question': 'Is there a return policy?',
      'answer':
          'Yes, items can be returned within 14 days of delivery. Check our Return Policy for more details.',
    },
    {
      'question': 'How do I apply a discount code?',
      'answer':
          'You can enter your discount code at checkout in the "Promo Code" field before completing your order.',
    },
    {
      'question': 'Why is my order delayed?',
      'answer':
          'Delays may occur due to high demand, weather conditions, or courier issues. Please check the "Orders" section for updates.',
    },
    {
      'question': 'Can I change my email address?',
      'answer':
          'Yes, go to Settings > Account > Email and update your email address.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        final faq = faqs[index];
        return Padding(
          padding: const EdgeInsets.only(top: 6),
          child: ExpansionTile(
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
          ),
        );
      },
    );
  }
}
