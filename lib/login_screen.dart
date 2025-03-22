import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 33),
                Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/3b9221579e87ef1bb5f73abf307af36ee0c45b7f6bfd5d5fb9be7da4592d501a?placeholderIfAbsent=true&apiKey=c9f5c80baddf4543b9d4e892dd89ff8c',
                  width: 98,
                  fit: BoxFit.contain,
                ),
                const Text(
                  'Please sign in to your existing account',
                  style: TextStyle(
                    color: Color(0xFFF98B00),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 2,
                  ),
                ),
                const SizedBox(height: 51),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF1F214D),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        label: 'Email',
                        hintText: 'example@gmail.com',
                        controller: _emailController,
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        label: 'Password',
                        hintText: '**********',
                        isPassword: true,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value ?? false;
                                    });
                                  },
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 29),
                      TextButton(
                        onPressed: () {
                          // Implement login logic
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFFFBD69),
                          padding: const EdgeInsets.symmetric(vertical: 23),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'LOG IN',
                          style: TextStyle(
                            color: Color(0xFF1F214D),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 38),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 11),
                          TextButton(
                            onPressed: () {
                              // Implement sign up navigation
                            },
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 27),
                      const Center(
                        child: Text(
                          'Or',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: Image.network(
                          'https://cdn.builder.io/api/v1/image/assets/TEMP/691fd7d42416d7e6d7d80e6f5b52fd9177a25a0bbf7c5c018270a6efde037e23?placeholderIfAbsent=true&apiKey=c9f5c80baddf4543b9d4e892dd89ff8c',
                          width: 28,
                          height: 28,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}