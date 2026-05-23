import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 800), // animation speed
        curve: Curves.easeInOutCubic, // smooth effect
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔥 Navbar
          Container(
            height: 60,
            color: Colors.black,
            child: Row(
              children: [
                TextButton(
                  onPressed: () => _scrollToSection(_homeKey),
                  child: Text("Home", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_aboutKey),
                  child: Text(
                    "About Us",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // 🔥 Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    key: _homeKey,
                    height: 600,
                    color: Colors.blue,
                    child: Center(child: Text("HOME SECTION")),
                  ),

                  Container(
                    key: _aboutKey,
                    height: 600,
                    color: Colors.green,
                    child: Center(child: Text("ABOUT US SECTION")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
