import 'package:flutter/material.dart';
import 'package:tashveer/common/widgets/text_input_field.dart';
import 'package:tashveer/screens/homepage_screen.dart';

import '../../common/widgets/snackbar.dart';
import '../controller/auth_methods.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  void signinUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailcontroller.text, password: _passwordcontroller.text);
    if (res == 'success') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => HomepageScreen(),
          ),
          (route) => false);
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextInputField(
                hintText: 'Your email',
                textInputType: TextInputType.emailAddress,
                icon: Icons.email_outlined,
                isPassword: false,
                controller: _emailcontroller),
          ),
          SizedBox(
            height: 60,
            child: TextInputField(
                hintText: 'Password',
                textInputType: TextInputType.text,
                icon: Icons.lock_outline,
                isPassword: true,
                controller: _passwordcontroller),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: signinUser,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: signinUser,
            child: Container(
              width: size.width * 0.8,
              height: 50,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFB8BFC0).withOpacity(0.8),
              ),
              child: Center(
                child: !isLoading
                    ? const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    : const CircularProgressIndicator(
                        color: Colors.black,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
