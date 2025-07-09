import 'package:flutter/material.dart';
import 'package:selcax_pos/services/auth_service.dart';
import 'package:selcax_pos/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String message = "Loading";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
  );

  void submitLogin(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if(email.isEmpty || password.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email dan password tidak boleh kosong"))
      );
      return;
    }

    try {
      String result = await ApiService.login(email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result), backgroundColor: Colors.green),
      );

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tes Font Poppins SemiBold',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 300,
              height: 50,
              child: TextField(
                controller: emailController,
                style: TextStyle(fontWeight: FontWeight.w400),
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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Input Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () => submitLogin(context),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
