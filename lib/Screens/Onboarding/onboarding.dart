import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Screens/Authentication/Login/login_screen.dart';
import 'package:smart_education/Screens/Authentication/Signin/sign_screen.dart';
import 'package:smart_education/shared/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String title;
  final String body1;
  final String body2;
  final String body3;
  final String image;

  BoardingModel({
    required this.title,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.image,
  });
}

var boardController = PageController();

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLast = false;
  int pageIndex = 0;
  List<BoardingModel> boarding = [
    BoardingModel(
      title: 'Best Learning Exp.',
      body1: 'No more frequent flaws, no boundaries \n',
      body2: 'between the teacher and his students.',
      body3: '',
      image: 'assets/onboarding1.svg',
    ),
    BoardingModel(
      title: 'Perfect community',
      body1: '“You will never walk alone” is what we worked \n',
      body2: 'for in order to reduce the gap between \n',
      body3: '  student and the teacher.',
      image: 'assets/onboarding2.svg',
    ),
    BoardingModel(
      title: 'Join Now',
      body1: 'No matter how complex your course content \n ',
      body2: 'is , Smart-edu is smart enough to keep \n students ',
      body3: 'focused on what they have to do.',
      image: 'assets/onboarding3.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.getProportionateScreenHeight(30),
        ),
        child: Column(
          children: [
            //PageView buildBoarding
            Container(
              height: SizeConfig.screenHeight * 0.5,
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      pageIndex = index;
                      isLast = false;
                    });
                  } else {
                    setState(() {
                      pageIndex = index;
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBoarding(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: SizeConfig.getProportionateScreenHeight(45),
            ),
            Row(
              children: [
                if (pageIndex == 0)
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(HexColor('E3F2FD')),
                    ),
                    onPressed: () {
                      if (!isLast || isLast) {
                        boardController.previousPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                if (pageIndex != 0)
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(HexColor('0053CB')),
                    ),
                    onPressed: () {
                      if (!isLast || isLast) {
                        boardController.previousPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                Spacer(),
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: HexColor('E3F2FD'),
                    activeDotColor: HexColor('0053CB'),
                    dotHeight: 14,
                    dotWidth: 14,
                    spacing: 8,
                    expansionFactor: 3,
                  ),
                  count: boarding.length,
                ),
                Spacer(),
                if (pageIndex == 1 || pageIndex == 0)
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(HexColor('0053CB')),
                    ),
                    onPressed: () {
                      if (isLast) {
                        navigateandFinish(context, LoginScreen());
                      } else {
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 1000,
                          ),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
                if (pageIndex == 2)
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(HexColor('E3F2FD')),
                    ),
                    onPressed: () {
                      if (isLast) {
                      } else {
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 1000,
                          ),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
              ],
            ),
            if (pageIndex != 2)
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(165),
              ),
            if (pageIndex == 2)
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(85),
              ),
            if (pageIndex != 2)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Row(
                        children: [
                          Text(
                            'Skip',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: HexColor('90CAF9'),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(HexColor('90CAF9')),
                      ),
                      onPressed: () {
                        navigateandFinish(context, LoginScreen());
                      },
                    ),
                  ],
                ),
              ),
            if (pageIndex == 2)
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(
                      SizeConfig.getProportionateScreenWidth(396),
                      SizeConfig.getProportionateScreenHeight(56),
                    ),
                  ),
                  //396 56
                  backgroundColor:
                      MaterialStateProperty.all(HexColor('0053CB')),
                ),
                child: Text(
                  'Join Now — Create a new account',
                  style: TextStyle(
                    color: HexColor('FFFFFF'),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onPressed: () {
                  navigateandFinish(context, SignUpScreen());
                },
              ),
            if (pageIndex == 2)
              TextButton(
                onPressed: () {
                  navigateandFinish(context, LoginScreen());
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Already have an account?  ',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          color: HexColor('1E88E5'),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          color: HexColor('1565C0'),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget buildBoarding(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SvgPicture.asset(
            model.image,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: SizeConfig.getProportionateScreenHeight(40),
        ),
        Text(
          model.title,
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: HexColor('0053CB'),
          ),
        ),
        SizedBox(
          height: SizeConfig.getProportionateScreenHeight(24),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: model.body1,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: HexColor('1E88E5'),
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: model.body2,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: HexColor('1E88E5'),
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: model.body3,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: HexColor('1E88E5'),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );

// class OnboardingScreen extends StatelessWidget {
//   OnboardingScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<BoardingModel> boarding = [
//       BoardingModel(
//         title: 'Best Learning Exp.',
//         body1: 'No more frequent flaws, no boundaries \n',
//         body2: 'between the teacher and his students.',
//         body3: '',
//         image: 'assets/onboarding1.svg',
//       ),
//       BoardingModel(
//         title: 'Perfect community',
//         body1: '“You will never walk alone” is what we worked \n',
//         body2: 'for in order to reduce the gap between \n',
//         body3: '  student and the teacher.',
//         image: 'assets/onboarding2.svg',
//       ),
//       BoardingModel(
//         title: 'Join Now',
//         body1: 'No matter how complex your course content \n ',
//         body2: 'is , Smart-edu is smart enough to keep \n students ',
//         body3: 'focused on what they have to do.',
//         image: 'assets/onboarding3.svg',
//       ),
//     ];
//     return BlocProvider(
//       create: (context) => Mybloc(),
//       child: BlocConsumer<Mybloc, AppStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(),
//             body: Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 30.0,
//               ),
//               child: Column(
//                 children: [
//                   //PageView buildBoarding
//                   Container(
//                     height: MediaQuery.of(context).size.height * .5,
//                     child: PageView.builder(
//                       controller: boardController,
//                       onPageChanged: (int index) {
//                         if (index == boarding.length - 1) {
//                           Mybloc.get(context).pageIndex = index;
//                           Mybloc.get(context).isLast = false;
//                         } else {
//                           Mybloc.get(context).pageIndex = index;
//                           Mybloc.get(context).isLast = false;
//                         }
//                       },
//                       physics: BouncingScrollPhysics(),
//                       itemBuilder: (context, index) => buildBoarding(
//                         boarding[index],
//                       ),
//                       itemCount: boarding.length,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 45,
//                   ),
//                   Row(
//                     children: [
//                       if (Mybloc.get(context).pageIndex == 0)
//                         TextButton(
//                           style: ButtonStyle(
//                             foregroundColor:
//                             MaterialStateProperty.all(HexColor('E3F2FD')),
//                           ),
//                           onPressed: () {
//                             if (!Mybloc.get(context).isLast ||
//                                 Mybloc.get(context).isLast) {
//                               boardController.previousPage(
//                                 duration: Duration(
//                                   milliseconds: 750,
//                                 ),
//                                 curve: Curves.fastOutSlowIn,
//                               );
//                             }
//                           },
//                           child: Icon(Icons.arrow_back),
//                         ),
//                       if (Mybloc.get(context).pageIndex != 0)
//                         TextButton(
//                           child: Icon(Icons.arrow_back),
//                           style: ButtonStyle(
//                             foregroundColor: MaterialStateProperty.all(
//                               HexColor('0053CB'),
//                             ),
//                           ),
//                           onPressed: () {
//                             if (!Mybloc.get(context).isLast ||
//                                 Mybloc.get(context).isLast) {
//                               boardController.previousPage(
//                                 duration: Duration(
//                                   milliseconds: 750,
//                                 ),
//                                 curve: Curves.fastOutSlowIn,
//                               );
//                             }
//                           },
//                         ),
//                       Spacer(),
//                       SmoothPageIndicator(
//                         controller: boardController,
//                         effect: ExpandingDotsEffect(
//                           dotColor: HexColor('E3F2FD'),
//                           activeDotColor: HexColor('0053CB'),
//                           dotHeight: 14,
//                           dotWidth: 14,
//                           spacing: 8,
//                           expansionFactor: 3,
//                         ),
//                         count: boarding.length,
//                       ),
//                       Spacer(),
//                       if (Mybloc.get(context).pageIndex == 1 ||
//                           Mybloc.get(context).pageIndex == 0)
//                         TextButton(
//                           style: ButtonStyle(
//                             foregroundColor:
//                             MaterialStateProperty.all(HexColor('0053CB')),
//                           ),
//                           onPressed: () {
//                             if (Mybloc.get(context).isLast) {
//                               navigateandFinish(context, LoginScreen());
//                             } else {
//                               boardController.nextPage(
//                                 duration: Duration(
//                                   milliseconds: 1000,
//                                 ),
//                                 curve: Curves.fastOutSlowIn,
//                               );
//                             }
//                           },
//                           child: Icon(Icons.arrow_forward),
//                         ),
//                       if (Mybloc.get(context).pageIndex == 2)
//                         TextButton(
//                           style: ButtonStyle(
//                             foregroundColor:
//                             MaterialStateProperty.all(HexColor('E3F2FD')),
//                           ),
//                           onPressed: () {
//                             if (Mybloc.get(context).isLast) {
//                             } else {
//                               boardController.nextPage(
//                                 duration: Duration(
//                                   milliseconds: 1000,
//                                 ),
//                                 curve: Curves.fastOutSlowIn,
//                               );
//                             }
//                           },
//                           child: Icon(Icons.arrow_forward),
//                         ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * .1,
//                   ),
//                   if (Mybloc.get(context).pageIndex != 2)
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           TextButton(
//                             child: Row(
//                               children: [
//                                 Text(
//                                   'Skip',
//                                   style: TextStyle(
//                                       fontStyle: FontStyle.normal,
//                                       color: HexColor('90CAF9'),
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16),
//                                 ),
//                                 Icon(Icons.arrow_forward),
//                               ],
//                             ),
//                             style: ButtonStyle(
//                               foregroundColor:
//                               MaterialStateProperty.all(HexColor('90CAF9')),
//                             ),
//                             onPressed: () {
//                               navigateandFinish(context, LoginScreen());
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   if (Mybloc.get(context).pageIndex == 2)
//                     ElevatedButton(
//                       style: ButtonStyle(
//                         fixedSize: MaterialStateProperty.all(Size(
//                           MediaQuery.of(context).size.width * .925,
//                           MediaQuery.of(context).size.height * .065,
//                         )),
//                         backgroundColor:
//                         MaterialStateProperty.all(HexColor('0053CB')),
//                       ),
//                       child: Text(
//                         'Join Now — Create a new account',
//                         style: TextStyle(
//                             color: HexColor('FFFFFF'),
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                             fontStyle: FontStyle.normal),
//                       ),
//                       onPressed: () {
//                         navigateandFinish(context, SignUpScreen());
//                       },
//                     ),
//                   if (Mybloc.get(context).pageIndex == 2)
//                     TextButton(
//                       onPressed: () {
//                         navigateandFinish(context, LoginScreen());
//                       },
//                       child: RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                             children: <TextSpan>[
//                               TextSpan(
//                                 text: 'Already have an account?  ',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontStyle: FontStyle.normal,
//                                   color: HexColor('1E88E5'),
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: ' Login',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontStyle: FontStyle.normal,
//                                   color: HexColor('1565C0'),
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           )),
//                     )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
