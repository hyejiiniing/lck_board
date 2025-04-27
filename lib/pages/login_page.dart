import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    print('Login attempt: $email / $password');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login attempt: $email')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 24),

              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/login/kakao_logo.png',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/login/google_logo.png',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/login/apple_logo.png',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/login/naver_logo.png',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
