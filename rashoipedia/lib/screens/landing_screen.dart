import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:rashoipedia/oath/screens/signin_screen.dart';
import 'package:rashoipedia/widgets/custom_button.dart';

import '../oath/screens/signup_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
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
              delay: const Duration(seconds: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Find the perfect recipes',
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    text: 'Sign In',
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (_, __, ___) => const SignInScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween(
                                begin: const Offset(0.0, 1.0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                        ),
                      );
                    },
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
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (_, __, ___) => const SignUpScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween(
                                begin: const Offset(0.0, 1.0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                        ),
                      );
                    },
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
