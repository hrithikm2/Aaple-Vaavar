import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aaple_vaavar/drawerPages/homescreen.dart';
import 'SplashScreen.dart';
import 'drawerPages/aboutres.dart';
import 'drawerPages/contactus.dart';
import 'drawerPages/menu.dart';
import 'drawerPages/viewmaps.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'login/loginmain.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.orange),
      darkTheme: ThemeData(primaryColor: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(duration: 3, goToPage: HomePage()
      )
  )
  );
}

class MyAppFul extends StatefulWidget {
  @override
  _MyAppFulState createState() => _MyAppFulState();
}

class _MyAppFulState extends State<MyAppFul> {
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('res/logo.png', scale: 13),
              Text('     Enjoy Family Time @Farm\n   with delicious traditional food',
                  style: TextStyle(fontFamily: 'Pacifico',)).text.red600.lineHeight(1.5).make(),],
          ),
          iconTheme: IconThemeData(color: Colors.orange),
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,

          backgroundColor: Colors.white,
          //Color(0xffcf91ff),
          // actions: [
          //   IconButton(
          //       icon: Icon(
          //         Icons.supervised_user_circle,
          //         size: 28,
          //       ),
          //       onPressed: () {})
          // ]
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: DrawerHeader(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Image.asset(
                                  "res/admin.png",
                                ),
                              ),
                              Text(
                                "Hello User!",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Image.asset(
                          "res/home.png",
                          scale: 2,
                        ),
                        title: Text('HomePage'),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            _pageController.jumpToPage(0);
                          });
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          "res/maps.png",
                          scale: 2,
                        ),
                        title: Text('View Location'),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            _pageController.jumpToPage(1);
                          });
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          "res/help_support.png",
                          scale: 2,
                        ),
                        title: Text('Contact Us'),
                        onTap: () {
                          Navigator.pop(context);
                          _pageController.jumpToPage(2);
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          "res/submenu_ic.png",
                          scale: 1.5,
                        ),
                        title: Text('Menu'),
                        onTap: () {
                          Navigator.pop(context);
                          _pageController.jumpToPage(3);
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          "res/logo.png",
                          width: 40,
                          height: 40,
                        ),
                        title: Text('About Us'),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {

                          });
                          _pageController.jumpToPage(4);
                        },
                      ),
                    ],
                  ),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log out'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                },
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Homescreen(),
            ViewMaps(),
            ContactUs(),
            MenuList(),
            AboutRestro(),
          ],
          //bottomNavigationBar: ,
        ),
      bottomNavigationBar:
         CurvedNavigationBar(
           height: MediaQuery.of(context).size.height * 0.06,
           backgroundColor: Colors.orange,
           items: <Widget>[
             Icon(Icons.verified_user, size: 30),
             Icon(Icons.home_filled, size: 30),
             Icon(Icons.login_outlined, size: 30),
           ],
           onTap: (index) {
             //Handle button tap
           },
         ),

    );
  }
}
