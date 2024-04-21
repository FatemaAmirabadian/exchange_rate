import 'package:flutter/material.dart';
import './widgets/ExchangeWidget.dart';
import './widgets/GoldWidget.dart';
import 'package:persian_fonts/persian_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: PersianFonts.vazirTextTheme,
      ),
      title: 'Currencies',
      home: DoubleTapExitApp(),
    );
  }
}

class DoubleTapExitApp extends StatefulWidget {
  @override
  _DoubleTapExitAppState createState() => _DoubleTapExitAppState();
}

class _DoubleTapExitAppState extends State<DoubleTapExitApp> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('برای خروج مجددا دکمه بازگشت را فشار دهید.'),
              duration: Duration(seconds: 5),
            ),
          );
          return false;
        }
        return true;
      },
      child: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            currentPageIndex == 0 ? 'طلا و سکه' : 'ارزها',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 80,
                color: Colors.purple,
              ),
              SizedBox(height: 30),
              ListTile(
                title: Text('زبان فارسی'),
              ),
              ListTile(
                title: Text('زبان انگلیسی'),
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: [
            GoldWidget(),
            ExchangeWidget(),
          ],
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.diamond_outlined, size: 25),
              label: 'gold',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money, size: 25),
              label: 'currencies',
            ),
          ],
          currentIndex: currentPageIndex,
          onTap: (int index) {
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
