// Copyright (c) 2020 Apfel
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software.
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import "package:flutter/material.dart";
import "package:stuff/about.dart";
import "package:stuff/projects.dart";
import "package:stuff/utilities.dart";

import 'utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Apfel's website",
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.orange,
      accentColor: Colors.orangeAccent,
      cardTheme: CardTheme(
        elevation: 8
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 48.0,
        selectedItemColor: Colors.orange,
        backgroundColor: Color(0xFF1F1F1F)
      ),
      fontFamily: "NotoSans",
      visualDensity: VisualDensity.adaptivePlatformDensity
    ),
    home: MainPage()
  ));
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageURLs {
  static const String github  = "https://github.com/Apfel";
  static const String reddit  = "https://www.reddit.com/user/IndeedItsApfel";
  static const String twitter = "https://twitter.com/YaBoiApfel/";
  static const String youtube = "https://www.youtube.com/channel/UCERSSPG9CFb_hAP6VDmM-eQ";
}

class MainPageState extends State<MainPage> {
  int selectedPage = 0;

  static List<Widget> widgets = [
    AboutTab(),
    ProjectsTab()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Apfel's website"),
      elevation: 24,
      actions: [
        IconButton(
          icon: Image(
            image: AssetImage("assets/github.png"),
            semanticLabel: "GitHub"
          ),
          tooltip: "GitHub",
          onPressed: () => Utilities.showURLDialog(context, MainPageURLs.github, "GitHub")
        ),
        IconButton(
          icon: Image(
            image: AssetImage("assets/reddit.png"),
            semanticLabel: "reddit"
          ),
          tooltip: "reddit",
          onPressed: () => Utilities.showURLDialog(context, MainPageURLs.reddit, "reddit")
        ),
        IconButton(
          icon: Image(
            image: AssetImage("assets/twitter.png"),
            semanticLabel: "Twitter",
          ),
          tooltip: "Twitter",
          onPressed: () => Utilities.showURLDialog(context, MainPageURLs.twitter, "Twitter")
        ),
        IconButton(
          icon: Image(
            image: AssetImage("assets/youtube.png"),
            semanticLabel: "YouTube",
          ),
          tooltip: "YouTube",
          onPressed: () => Utilities.showURLDialog(context, MainPageURLs.youtube, "YouTube"),
        )
      ]
    ),
    body: Center(
      child: widgets.elementAt(selectedPage)
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            semanticLabel: "About"
          ),
          title: Text("About")
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.article,
            semanticLabel: "Projects"
          ),
          title: Text("Projects"),
        )
      ],
      currentIndex: selectedPage,
      onTap: (index) => setState(() => selectedPage = index),
    )
  );
}
