import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mindo_app/pages/home_page.dart';
import 'package:mindo_app/pages/signup_page.dart';
//import 'package:get/get.dart';
import 'package:mindo_app/providers/mode_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<ConsumerStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      return true;
    } else {
      return false;
    }
  }

  bool isShowingPass = false;
  @override
  void initState() {
    super.initState();
    isShowingPass = false;
  }

  @override
  Widget build(BuildContext context) {
    final modeChecker = ref.watch(mode);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.16,
                ),
                Padding(
                  padding: EdgeInsets.only(right: w * 0.64),
                  child: SvgPicture.asset(
                    modeChecker
                        ? 'assets/images/login_page_images/login_logo_light_mode.svg'
                        : 'assets/images/login_page_images/login_logo_dark_mode.svg',
                    width: w * 0.19,
                    height: w * 0.19,
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(right: w * 0.27),
                  child: RichText(
                      text: TextSpan(
                          text: 'Welcome!',
                          style: Theme.of(context).textTheme.headlineLarge,
                          children: [
                        TextSpan(
                          text: "\nSign in to continue",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ])),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    w * 0.12,
                    w * 0.09,
                    w * 0.09,
                    w * 0.09,
                  ),
                  child: TextFormField(
                    validator: (value) {
                      final validRegex = RegExp(r'^\w+@\w+\.\w+$');
                      if (value!.trim().isEmpty) {
                        return "please, Enter your email!";
                      }
                      if (!validRegex.hasMatch(value)) {
                        return "Please enter a valid email address.";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: w * 0.003,
                              color: const Color(0xff96A7AF),
                              strokeAlign: BorderSide.strokeAlignCenter)),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      hintText: 'Enter your email',
                      hintStyle: Theme.of(context).textTheme.labelSmall,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: w * 0.006,
                            color: const Color(0xff4657A7),
                            strokeAlign: BorderSide.strokeAlignCenter),
                      ),
                      focusColor: const Color(0xff4657A7),
                      fillColor: const Color(0xff4657A7),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    w * 0.12,
                    w * 0.01,
                    w * 0.09,
                    w * 0.01,
                  ),
                  child: TextFormField(
                    obscureText: isShowingPass ? false : true,
                    enableSuggestions: false,
                    autocorrect: false,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "please, Enter your password!";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: w * 0.003,
                                color: const Color(0xff96A7AF),
                                strokeAlign: BorderSide.strokeAlignCenter)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        hintText: 'Enter your password',
                        hintStyle: Theme.of(context).textTheme.labelSmall,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: w * 0.006,
                              color: const Color(0xff4657A7),
                              strokeAlign: BorderSide.strokeAlignCenter),
                        ),
                        focusColor: const Color(0xff4657A7),
                        fillColor: const Color(0xff4657A7),
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(
                            isShowingPass
                                ? 'assets/icons/login_page_icons/opened_eye_for_pass.svg'
                                : 'assets/icons/login_page_icons/closed_eye_for_pass.svg',
                          ),
                          onPressed: () {
                            setState(() {
                              isShowingPass = !isShowingPass;
                            });
                          },
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(right: w * 0.04),
                      child: Text(
                        'Forgot password?',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.only(
                        left: w * 0.277,
                        right: w * 0.277,
                        top: w * 0.038,
                        bottom: w * 0.038,
                      ),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            w * 0.02,
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_saveForm()) {
                        Get.to(const HomePage(), transition: Transition.zoom);
                      }
                    });
                  },
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sign in',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      SvgPicture.asset(
                        'assets/icons/login_page_icons/arrow_for_login_button.svg',
                        width: w * 0.04,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: w * 0.12,
                    ),
                    Container(
                      height: h * 0.002,
                      width: h * 0.16,
                      color: const Color.fromARGB(180, 150, 167, 175),
                    ),
                    SizedBox(
                      width: w * 0.01,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                        color: const Color.fromARGB(180, 150, 167, 175),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: h * 0.02,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.01,
                    ),
                    Container(
                      height: h * 0.002,
                      width: h * 0.16,
                      color: const Color.fromARGB(180, 150, 167, 175),
                    ),
                    SizedBox(
                      width: w * 0.1,
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    side: WidgetStatePropertyAll(
                      BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.only(
                        left: w * 0.2,
                        right: w * 0.2,
                        top: w * 0.034,
                        bottom: w * 0.034,
                      ),
                    ),
                    foregroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.primary,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            w * 0.02,
                          ),
                        ),
                      ),
                    ),

                    //Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    Get.to(const SignupPage(), transition: Transition.zoom);
                  },
                  child: Text(
                    'Create an account',
                    style: TextStyle(
                      color: const Color(0xff4657A7),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: h * 0.019,
                    ),
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
