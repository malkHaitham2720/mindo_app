import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mindo_app/data_models/model.dart';
import 'package:mindo_app/data_models/quizes_data.dart';
// import 'package:mindo_app/providers/mode_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePage();
}

class _HomePage extends ConsumerState<ConsumerStatefulWidget> {
  int leftSideCount = 0;
  int rightSideCount = 1;
  @override
  void initState() {
    leftSideCount = 0;
    rightSideCount = 1;
    super.initState();
  }

  void increamintTheLeftSideCount() {
    leftSideCount++;
  }

  void increamintTheRightSideCount() {
    rightSideCount++;
  }

  List<QuizInformation> theRightSideItems(List<QuizInformation> list) {
    int length = (list.length ~/ 2).toInt();
    List<QuizInformation> generatedList = [];
    for (int i = 0; i < length; i++) {
      generatedList.add(list[i]);
    }
    return generatedList;
  }

  List<QuizInformation> theLeftSideItems(List<QuizInformation> list) {
    int length = (list.length ~/ 2).toInt();
    List<QuizInformation> generatedList = [];
    for (int i = list.length - 1; i >= length; i--) {
      generatedList.add(list[i]);
    }
    return generatedList;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                w * 0.04,
                w * 0.043,
                w * 0.04,
                w * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: 'Hi, john',
                          style: Theme.of(context).textTheme.titleLarge,
                          children: [
                            TextSpan(
                              text: "\nlet's make this day productive",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/home_page_icons/26.png',
                            width: w * 0.26,
                            height: w * 0.23,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: w * 0.8,
                    height: h * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          w * 0.04,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 8,
                            offset: const Offset(3, 4),
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/icons/home_page_icons/trophy_icon.png',
                              width: w * 0.26,
                              height: w * 0.23,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: 'Ranking',
                            style: Theme.of(context).textTheme.titleSmall,
                            children: [
                              TextSpan(
                                text: "\n1234",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w900,
                                  fontSize: h * 0.02,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      r"Let's Play",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...theLeftSideItems(quizesQuestions).map((item) {
                            increamintTheLeftSideCount();
                            return CustomCategoryCard(
                              iconUrl: item.quizName.toLowerCase(),
                              quizInformation: item,
                              heightAmount:
                                  leftSideCount % 2 == 0 ? 0.33 : 0.27,
                            );
                          }),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...theRightSideItems(quizesQuestions).map((item) {
                            increamintTheRightSideCount();

                            return CustomCategoryCard(
                              iconUrl: item.quizName.toLowerCase(),
                              quizInformation: item,
                              heightAmount:
                                  rightSideCount % 2 != 0 ? 0.27 : 0.33,
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCategoryCard extends ConsumerWidget {
  const CustomCategoryCard({
    super.key,
    required this.iconUrl,
    required this.quizInformation,
    required this.heightAmount,
  });
  final String iconUrl;
  final QuizInformation quizInformation;
  final double heightAmount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final modeChecker = ref.watch(mode);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w * 0.42,
      height: h * heightAmount,
      child: Stack(
        children: [
          Positioned.fill(
            top: h * 0.045,
            child: Container(
              width: w * 0.45,
              height: h * heightAmount,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    w * 0.04,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 8,
                      offset: const Offset(3, 4),
                    )
                  ]),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.01,
                ),
                Padding(
                  padding: heightAmount == 0.33
                      ? EdgeInsets.only(
                          left: w * 0.01,
                          top: w * 0.02,
                          bottom: w * 0.08,
                        )
                      : EdgeInsets.only(
                          left: w * 0.01,
                          top: w * 0.02,
                        ),
                  child: Image.asset(
                    'assets/icons/home_page_icons/${iconUrl}_quiz_icon.png',
                    // 'assets/icons/home_page_icons/chemistry_quiz_icon.png',
                  ),
                ),
                SizedBox(
                  height: h * heightAmount == 0.33 ? 0.16 : 0.02,
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: quizInformation.quizName,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: h * 0.025,
                    ),
                    children: [
                      TextSpan(
                        text:
                            '\n${quizInformation.numbersOfQuestions.toString()} questions',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: h * 0.015,
                          height: 0.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
