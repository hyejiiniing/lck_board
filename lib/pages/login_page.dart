import 'package:flutter/material.dart';
import 'package:ping_me/pages/login/pingme_login_form_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _handlePingMeLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PingMeLoginFormPage()),
    );
  }

  void _handleGoogleLogin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo/logo_icon.png',
                  width: 400,
                  height: 280,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 320,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFAE90E4),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _handlePingMeLogin,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo/app_icon.png',
                          width: 46,
                          height: 46,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Ping Me 로그인',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GoogleLoginButton(onPressed: _handleGoogleLogin),
                    const SizedBox(height: 20),
                    KakaoLoginButton(),
                    const SizedBox(height: 20),
                    NaverLoginButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleLoginButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF2F2F2),
          foregroundColor: Colors.black,
          minimumSize: Size(320, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Image.asset(
                'assets/images/login/google_logo.png',
                width: 44,
                height: 44,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Google 로그인',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class KakaoLoginButton extends StatelessWidget {
  const KakaoLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFFEB3B),
          foregroundColor: Colors.black,
          minimumSize: Size(320, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: Image.asset(
                'assets/images/login/kakao_logo.png',
                width: 37,
                height: 37,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              '카카오 로그인',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class NaverLoginButton extends StatelessWidget {
  const NaverLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF03C75A),
          foregroundColor: Colors.white,
          minimumSize: Size(320, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: Image.asset(
                'assets/images/login/naver_logo.png',
                width: 37,
                height: 37,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              '네이버 로그인',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
