import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sellsrateadmin/widget/text_input.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          obstrust: false,
          hintText: 'Email',
          controller: emailController,
          validator: (email) {
            // final bool _isValid =
            //     EmailValidator.validate(
            //         emailController.text);
            if (email!.isEmpty) {
              return 'Email field cannot be empty';
            }
            // else if (!_isValid) {
            //   return 'Invalid email';
            // }
            return null;
          },
        ),
        AppTextField(
          obstrust: false,
          hintText: 'Email',
          controller: emailController,
          validator: (email) {
            // final bool _isValid =
            //     EmailValidator.validate(
            //         emailController.text);
            if (email!.isEmpty) {
              return 'Email field cannot be empty';
            }
            // else if (!_isValid) {
            //   return 'Invalid email';
            // }
            return null;
          },
        ),
        AppTextField(
          obstrust: false,
          hintText: 'Email',
          controller: emailController,
          validator: (email) {
            // final bool _isValid =
            //     EmailValidator.validate(
            //         emailController.text);
            if (email!.isEmpty) {
              return 'Email field cannot be empty';
            }
            // else if (!_isValid) {
            //   return 'Invalid email';
            // }
            return null;
          },
        ),
        AppTextField(
          obstrust: false,
          hintText: 'Email',
          controller: emailController,
          validator: (email) {
            // final bool _isValid =
            //     EmailValidator.validate(
            //         emailController.text);
            if (email!.isEmpty) {
              return 'Email field cannot be empty';
            }
            // else if (!_isValid) {
            //   return 'Invalid email';
            // }
            return null;
          },
        ),
        AppTextField(
          obstrust: false,
          hintText: 'Email',
          controller: emailController,
          validator: (email) {
            // final bool _isValid =
            //     EmailValidator.validate(
            //         emailController.text);
            if (email!.isEmpty) {
              return 'Email field cannot be empty';
            }
            // else if (!_isValid) {
            //   return 'Invalid email';
            // }
            return null;
          },
        ),
        AppTextField(
          obstrust: false,
          hintText: 'Email',
          controller: emailController,
          validator: (email) {
            // final bool _isValid =
            //     EmailValidator.validate(
            //         emailController.text);
            if (email!.isEmpty) {
              return 'Email field cannot be empty';
            }
            // else if (!_isValid) {
            //   return 'Invalid email';
            // }
            return null;
          },
        ),
        AppTextField(
          obstrust: false,
          hintText: 'Email',
          controller: emailController,
          validator: (email) {
            // final bool _isValid =
            //     EmailValidator.validate(
            //         emailController.text);
            if (email!.isEmpty) {
              return 'Email field cannot be empty';
            }
            // else if (!_isValid) {
            //   return 'Invalid email';
            // }
            return null;
          },
        )
      ],
    );
  }
}
