import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF11998E)),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Payment Successful!')),
            );
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: const Text(
            'Pay Now',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
