import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mindo_app/pages/login_page.dart';
//import 'package:get/get.dart';
//import 'package:mindo_app/pages/home_page.dart';
import 'package:mindo_app/providers/mode_provider.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPage();
}

class _SignupPage extends ConsumerState<ConsumerStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  bool isSwap = false;
  late PageController pageController;
  late String userName;
  late String password = '';

  bool _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      return true;
    } else {
      return false;
    }
  }

  bool isShowingPass = false;
  bool isShowingPass2 = false;
  @override
  void initState() {
    super.initState();

    /// Instantiate the PageController in initState.
    pageController = PageController();
    isSwap = false;
    isShowingPass = false;
    isShowingPass = false;
  }

  @override
  Widget build(BuildContext context) {
    final modeChecker = ref.watch(mode);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
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
                      ? 'assets/images/login_page_images/login_logo_dark_mode.svg'
                      : 'assets/images/login_page_images/login_logo_light_mode.svg',
                  width: w * 0.19,
                  height: w * 0.19,
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: w * 0.07, right: isSwap ? w * 0.55 : w * 0.4),
                child: RichText(
                    text: TextSpan(
                        text: isSwap ? "Hello!" : 'Sign Up',
                        style: Theme.of(context).textTheme.headlineLarge,
                        children: [
                      TextSpan(
                        text: isSwap ? '\n$userName' : "\nto start working",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ])),
              ),
              SizedBox(
                width: w * 0.9,
                height: h * 0.35,
                child: PageView(
                  onPageChanged: (value) => setState(
                    () {
                      isSwap = !isSwap;
                    },
                  ),
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            w * 0.07,
                            w * 0.09,
                            w * 0.09,
                            w * 0.09,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              //if you use trim so you may havn't to check about spaces in Regx
                              final validRegex = RegExp(r'^(?=.*[A-Za-z]).+$');
                              if (value!.trim().isEmpty) {
                                return "Please enter your name.";
                              }
                              if (!validRegex.hasMatch(value)) {
                                return "Please enter a valid name using \nonly alphabetic characters";
                              } else {
                                setState(() {
                                  userName = value;
                                });
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: w * 0.003,
                                      color: const Color(0xff96A7AF),
                                      strokeAlign:
                                          BorderSide.strokeAlignCenter)),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              hintText: 'Enter your name',
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
                            w * 0.07,
                            w * 0.01,
                            w * 0.09,
                            w * 0.01,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              final validRegex = RegExp(r'\w+@\w+\.\w+');
                              if (value!.trim().isEmpty) {
                                return "Please enter your email.";
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
                                      strokeAlign:
                                          BorderSide.strokeAlignCenter)),
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
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            w * 0.07,
                            w * 0.09,
                            w * 0.09,
                            w * 0.09,
                          ),
                          child: TextFormField(
                            obscureText: isShowingPass ? false : true,
                            enableSuggestions: false,
                            autocorrect: false,
                            validator: (value) {
                              final lowercase = RegExp(r'[a-z]');
                              final uppercase = RegExp(r'[A-Z]');
                              final number = RegExp(r'[0-9]');
                              final specialChar = RegExp(r'\W+');
                              if (value!.trim().isEmpty) {
                                return "please create your password!";
                              }
                              if (!value.contains(lowercase)) {
                                return 'Your password must have a lowercase letter!';
                              } else if (!value.contains(uppercase)) {
                                return 'Your password must have an uppercase letter!';
                              } else if (!value.contains(number)) {
                                return 'Your password must have a number!';
                              } else if (!value.contains(specialChar)) {
                                return 'Your password must have at least one special \ncharacter!';
                              } else {
                                setState(() {
                                  password = value;
                                });
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: w * 0.003,
                                      color: const Color(0xff96A7AF),
                                      strokeAlign:
                                          BorderSide.strokeAlignCenter)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
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
                              ),
                              hintText: 'Create password',
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
                            w * 0.07,
                            w * 0.01,
                            w * 0.09,
                            w * 0.01,
                          ),
                          child: TextFormField(
                            obscureText: isShowingPass2 ? false : true,
                            enableSuggestions: false,
                            autocorrect: false,
                            validator: (value) {
                              if (value!.trim().isEmpty &&
                                  password.isNotEmpty) {
                                return "please repeat your password!";
                              }
                              if (value != password && password.isNotEmpty) {
                                return 'Passwords do not match. Please try again.';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: w * 0.003,
                                        color: const Color(0xff96A7AF),
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter)),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                                hintText: 'Repeat your password',
                                hintStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: w * 0.006,
                                      color: const Color(0xff4657A7),
                                      strokeAlign:
                                          BorderSide.strokeAlignCenter),
                                ),
                                focusColor: const Color(0xff4657A7),
                                fillColor: const Color(0xff4657A7),
                                suffixIcon: IconButton(
                                  icon: SvgPicture.asset(
                                    isShowingPass2
                                        ? 'assets/icons/login_page_icons/opened_eye_for_pass.svg'
                                        : 'assets/icons/login_page_icons/closed_eye_for_pass.svg',
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isShowingPass2 = !isShowingPass2;
                                    });
                                  },
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal: w * 0.07,
                            vertical: w * 0.05,
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
                          Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeIn,
                        );
                      },
                      label: SvgPicture.asset(
                        'assets/icons/sign_up_icons/back_to_previous_page_icon.svg',
                        width: w * 0.04,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.01,
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal: w * 0.277,
                            vertical: w * 0.038,
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
                          if (_saveForm() && isSwap) {
                            Get.to(const LoginPage(),
                                transition: Transition.fadeIn);
                          } else if (_saveForm()) {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeIn,
                            );
                          }
                        });
                      },
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            isSwap ? 'Finish' : 'Next',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          if (!isSwap)
                            SvgPicture.asset(
                              'assets/icons/login_page_icons/arrow_for_login_button.svg',
                              width: w * 0.04,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
