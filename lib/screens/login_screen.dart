import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Tes Font Poppins SemiBold',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ),
        body: const CustomTextField(),
      );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 300,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Input Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: 300,
            height: 50,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Input Password',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 30),
          Body3(),
        ],
      ),
    );
  }
}

class Body3 extends StatelessWidget {
  const Body3({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    );
    return Column(
      children: [
        ElevatedButton(
          style: style,
          onPressed: () {},
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
