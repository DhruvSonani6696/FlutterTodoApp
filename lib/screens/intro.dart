import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showNextButton: true,
      showDoneButton: true,
      showSkipButton: false,
      pages: [
        PageViewModel(
            image: SvgPicture.asset('assests/inro.svg'),
            title: 'ToDo Application')
      ],
    );
  }
}
