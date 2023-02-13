import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      showNextButton: true,
      showDoneButton: true,
      showSkipButton: false,
      done: const Text('Done'),
      onDone: () => Get.to(() => const Home()),
      next: const Icon(Icons.arrow_forward),
      pages: [
        PageViewModel(
          image: SvgPicture.asset('assets/intro.svg'),
          title: 'ToDo Application',
          body:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris accumsan nec sem auctor mollis. Suspendisse imperdiet, risus suscipit aliquam consectetur',
          decoration:
              const PageDecoration(imagePadding: EdgeInsets.only(top: 50.0)),
        ),
        PageViewModel(
          image: SvgPicture.asset('assets/intro1.svg'),
          title: 'ToDo Easy Application to Use',
          body:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris accumsan nec sem auctor mollis. Suspendisse imperdiet, risus suscipit aliquam consectetur',
          decoration:
              const PageDecoration(imagePadding: EdgeInsets.only(top: 50.0)),
        ),
      ],
    );
  }
}
