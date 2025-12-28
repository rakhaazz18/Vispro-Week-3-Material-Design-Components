import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('FunkyFit Demo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('This app demonstrates navigation, named routes, and deep linking integration.'),
            const SizedBox(height: 12),
            const Text('Credits: Material Codelab adapted by student.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate receiving a deep link to product/2
                Navigator.pushNamed(context, '/product', arguments: 2);
              },
              child: const Text('Test deep link → product/2'),
            ),
          ],
        ),
      ),
    );
  }
}
