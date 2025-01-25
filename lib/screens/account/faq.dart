import 'package:flutter/material.dart';

import '../f_a_q_item.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ - Ernes Technologies'),
      ),
      body: ListView(
        children: const [
          FAQItem(
            question: 'What products does Ernes Technologies offer?',
            answer:
                'Ernes Technologies offers a wide range of electronic products including smartphones, laptops, tablets, smart home devices, and accessories.',
          ),
          FAQItem(
            question:
                'Does Ernes Technologies provide warranty for its products?',
            answer:
                'Yes, Ernes Technologies provides warranty for all its products. Please refer to the product documentation for warranty details.',
          ),
          FAQItem(
            question:
                'Can I return or exchange a product purchased from Ernes Technologies?',
            answer:
                'Yes, Ernes Technologies accepts returns and exchanges within 30 days of purchase. Please ensure the product is in its original condition with all accessories and packaging.',
          ),
          FAQItem(
            question: 'How can I contact Ernes Technologies customer support?',
            answer:
                'You can contact Ernes Technologies customer support by phone at +254712345678 or by email at support@ernestechnologies.com.',
          ),
          
        ],
      ),
    );
  }
}
