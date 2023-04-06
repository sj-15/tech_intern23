import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:rashoipedia/oath/screens/signin_screen.dart';
import 'package:rashoipedia/widgets/custom_button.dart';
import '../oath/screens/signup_screen.dart';
import '../widgets/custom_text.dart';

class LandingScreen extends StatefulWidget {
  static String routeName = '/landing-screen';
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  void _showDialog(BuildContext context, Widget page) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return page;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent])
                  .createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              'assets/meal4.jpg',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DelayedDisplay(
              delay: const Duration(milliseconds: 1500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(shadows: [
                    Shadow(
                      blurRadius: 40,
                      color: Colors.blue,
                    )
                  ], text: 'Find the perfect recipes', fontSize: 42),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Over 20 thousand recipes',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    text: 'Sign In',
                    onPressed: () => _showDialog(context, const SignInScreen()),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: () => _showDialog(context, const SignUpScreen()),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
