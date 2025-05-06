import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PingMeLoginFormPage extends StatefulWidget {
  const PingMeLoginFormPage({super.key});

  @override
  State<PingMeLoginFormPage> createState() => _PingMeLoginFormPageState();
}

class _PingMeLoginFormPageState extends State<PingMeLoginFormPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    final url = Uri.parse('http://172.30.1.95:3000/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': email, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);

      print('statusCode: ${response.statusCode}');
      print('body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        print('로그인 성공: ${responseData['message']}');
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('로그인 성공')));
      } else {
        final errorData = jsonDecode(response.body);
        print('로그인 실패: ${errorData['message']}');
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorData['message'] ?? '로그인 실패')),
        );
      }
    } catch (e) {
      print('에러 발생: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('에러 발생: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PingMe 로그인')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: '이메일'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: '비밀번호'),
              obscureText: true,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _submitLogin,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
              child: const Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }
}
