import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(SelfCheckoutApp());
}

class SelfCheckoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelfCheckoutScreen(),
    );
  }
}

class SelfCheckoutScreen extends StatefulWidget {
  @override
  _SelfCheckoutScreenState createState() => _SelfCheckoutScreenState();
}

class _SelfCheckoutScreenState extends State<SelfCheckoutScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/kiosk.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double upiLogoWidth = MediaQuery.of(context).size.width * 0.4;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'YOU ARE UNDER SURVEILLANCE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 10,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            LayoutBuilder(
              builder: (context, constraints) {
                double fontSize = constraints.maxWidth * 0.05; // Adjust the multiplier as needed

                return RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Welcome to ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "INDIA's",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      TextSpan(
                        text: " First ",
                      ),
                      TextSpan(
                        text: "AI",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      TextSpan(
                        text: " powered self checkout Kiosk",
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            _controller.value.isInitialized
                ? SizedBox(
              height: screenHeight * 0.4,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            )
                : Container(
              height: screenHeight * 0.4,
              color: Colors.black,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "PLACE   SPACE   PAY",
              style: TextStyle(
                color: Color(0xFF338C36),
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.grey,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Ultra Fast Contact-less checkout",
              style: TextStyle(
                color: Color(0xFF2FAB34),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Pay via",
                    style: TextStyle(
                      color: Color(0xFF935D34),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/upi.png',
                          width: upiLogoWidth * 0.7,
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/phonepe.png',
                              width: upiLogoWidth * 0.7 /3,
                            ),
                            Image.asset(
                              'assets/gpay.png',
                              width: upiLogoWidth  * 0.7 /3,
                            ),
                            Image.asset(
                              'assets/paytm.png',
                              width: upiLogoWidth * 0.7 /3,
                            ),
                          ],
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
    );
  }
}
