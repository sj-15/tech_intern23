import 'package:flutter/material.dart';
import 'package:tashveer/common/widgets/text_input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

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
                hintText: 'Your Name',
                textInputType: TextInputType.emailAddress,
                icon: Icons.person,
                isPassword: false,
                controller: _namecontroller),
          ),
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
        ],
      ),
    );
  }
}
