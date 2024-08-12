import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mindo_app/providers/mode_provider.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => WelcomePageState();
}

class WelcomePageState extends ConsumerState<ConsumerStatefulWidget> {
  bool isSwap = false;
  @override
  Widget build(BuildContext context) {
    final modechecker = ref.watch(mode);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:
          modechecker ? const Color(0xff91A1ED) : const Color(0xff4555A5),
      body: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              modechecker
                  ? isSwap
                      ? 'assets/images/welcome_screen_images/welcome_background_page_light_mode_2.png'
                      : 'assets/images/welcome_screen_images/welcome_background_page_light_mode.png'
                  : isSwap
                      ? 'assets/images/welcome_screen_images/welcome_background_page_light_mode_2.png'
                      : ' assets/images/welcome_screen_images/welcome_background_page_dark_mode.png',
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: w * 0.9,
                height: h * 0.9,
                child: PageView(
                  onPageChanged: (value) => setState(() {
                    isSwap = !isSwap;
                  }),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: h * 0.15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: h * 0.06),
                          child: Text(
                            'test your self with\nMindo quizes',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                              fontSize: w * 0.09,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: "Hi, I'm ",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              height: 0.0,
                              fontFamily: 'Roboto',
                              fontSize: w * 0.055,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            children: [
                              TextSpan(
                                text: "Mindo!",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Roboto',
                                  fontSize: w * 0.05,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              TextSpan(
                                text: ''' Choose from various
categories and challenge yourself 
with multiple quizzes. Let's show the
world your genius!''',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Roboto',
                                  fontSize: w * 0.055,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: h * 0.1),
                          child: Image.asset(
                            'assets/images/welcome_screen_images/brain male character reading.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: h * 0.066,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: h * 0.16),
                          child: Text(
                            'Be the top \nwith Mindo',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                              fontSize: w * 0.1,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: h * 0.04),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: '''Earn points for each quiz you
complete and climb the leaderboard. 
Ready to become a Quizmaster                           
champion?
Tap''',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                height: 0.0,
                                fontFamily: 'Roboto',
                                fontSize: w * 0.05,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              children: [
                                TextSpan(
                                  text: r'"Start"',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Roboto',
                                    fontSize: w * 0.05,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                TextSpan(
                                  text: r'  to begin!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Roboto',
                                    fontSize: w * 0.055,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: h * 0.1),
                          child: Image.asset(
                            'assets/images/welcome_screen_images/brain male character having an idea.png',
                            fit: BoxFit.fill,
                            height: h * 0.45,
                          ),
                        ),
                      ],
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
