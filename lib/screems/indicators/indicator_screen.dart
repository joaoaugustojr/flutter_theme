import 'package:flutter/material.dart';
import 'package:flutter_learning/consts/consts_theme.dart';

class IndicatorScreen extends StatelessWidget {
  const IndicatorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Indicators UI",
      home: IndicatorsUI(),
    );
  }
}

class IndicatorsUI extends StatefulWidget {
  IndicatorsUI({Key key}) : super(key: key);

  @override
  _IndicatorsUIState createState() => _IndicatorsUIState();
}

class _IndicatorsUIState extends State<IndicatorsUI> {
  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: Text(
              "Skip",
              style: TextStyle(
                color: ColorSys.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              buildPage(
                image: "assets/images/step-one.png",
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              buildPage(
                reverse: true,
                image: "assets/images/step-two.png",
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              buildPage(
                image: "assets/images/step-three.png",
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  // Builds

  Widget buildPage({image, title, content, reverse = false}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !reverse
              ? Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(image),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              : SizedBox(),
          Text(
            title,
            style: TextStyle(
              color: ColorSys.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorSys.gray,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          reverse
              ? Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(image),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (var i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 35 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: ColorSys.secoundry,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
