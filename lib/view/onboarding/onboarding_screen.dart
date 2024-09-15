import 'package:flutter/material.dart';
import 'package:pizza_app/providers/onborading_provider.dart';
import 'package:pizza_app/view/onboarding/onboarding_screen/first_onboarding.dart';
import 'package:pizza_app/view/onboarding/onboarding_screen/second_onboarding.dart';
import 'package:pizza_app/view/onboarding/onboarding_screen/third_onboarding.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, onboarding, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.red,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Visibility(
                  visible: onboarding.currentTab !=
                      0, // Show back button on pages 1 and 2
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      onboarding.jumpToPreviousPage();
                    },
                    child: Text('Back'),
                  ),
                ),
              ],
            ),
          ),
          body: Consumer<OnboardingProvider>(
            builder: (context, onboarding, _) {
              return PageView(
                controller: onboarding.pageController,
                // Remove NeverScrollableScrollPhysics if swiping is desired
                // physics: NeverScrollableScrollPhysics(),
                children: const [
                  FirstOnboarding(),
                  SecondOnboarding(),
                  ThirdOnboarding(),
                ],
              );
            },
          ),
          bottomNavigationBar: SizedBox(
            height: 100,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // Uncomment and customize for back button on first page
                  // CircleAvatar(
                  //   child: Icon(Icons.arrow_back_ios),
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  InkWell(
                    onTap: () {
                      onboarding.jumpToNextPage(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          onboarding.currentTab == 2 ? 'Finish' : 'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
