import 'package:flutter/material.dart';
import './widgets/ExchangeWidget.dart';
import './widgets/GoldWidget.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'custom_theme.dart';

void main(){runApp( MyApp(),);}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: PersianFonts.vazirTextTheme,
        ),
        title: 'Currencies',
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              appBar: AppBar(
                title: const Text('ارزها',style: TextStyle(color: Colors.white),),
                backgroundColor: CustomTheme.lightTheme.primaryColor,
                iconTheme: IconThemeData(color: Colors.white),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      height: 80,
                      color: CustomTheme.lightTheme.primaryColor,
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
              body: [
                GoldWidget(),
                ExchangeWidget()
              ][currentPageIndex],
              bottomNavigationBar: Container(
                height: 70,
                child: BottomNavigationBar(
                    items: [
                    BottomNavigationBarItem(
                    icon: Icon(Icons.diamond_outlined,size: 32,),
                    label: 'gold',
                     ),
                     BottomNavigationBarItem(
                    icon: Icon(Icons.attach_money,size: 32,),
                    label: 'currencies',
                  ),
                  ],
                  currentIndex: currentPageIndex,
                  onTap: (int index) {
                  setState(() {
                  currentPageIndex = index;
                });},
                showSelectedLabels: false,
                  showUnselectedLabels: false,
                ),
              ),
          ),
        )
    );
  }
}