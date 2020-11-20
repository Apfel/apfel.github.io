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
import "about.dart";
import "projects.dart";
import "utilities.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Apfel's website",
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.orange,
      accentColor: Colors.orangeAccent,
      cardTheme: CardTheme(elevation: 8),
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
  _MainPageState createState() => _MainPageState();
}

class _MainPageURLs {
  static const String github  = "https://github.com/Apfel";
  static const String reddit  = "https://www.reddit.com/user/IndeedItsApfel";
  static const String twitter = "https://twitter.com/YaBoiApfel/";
  static const String youtube = "https://www.youtube.com/channel/UCERSSPG9CFb_hAP6VDmM-eQ";
}

class _MainPageIconButton extends StatelessWidget {
  final ImageProvider<Object> image;
  final String                tooltip;
  final String                url;

  _MainPageIconButton(this.image, this.tooltip, this.url);

  @override
  Widget build(BuildContext context) => IconButton(
    icon: Image(
      image: image,
      semanticLabel: tooltip
    ),
    tooltip: tooltip,
    onPressed: () => Utilities.showURLDialog(context, url, tooltip)
  );
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;

  static List<Widget> widgets = [
    AboutTab(),
    ProjectsTab()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Apfel's website"),
      elevation: 24,
      actions: [
        _MainPageIconButton(AssetImage("assets/github.png"), "GitHub", _MainPageURLs.github),
        _MainPageIconButton(AssetImage("assets/reddit.png"), "reddit", _MainPageURLs.reddit),
        _MainPageIconButton(AssetImage("assets/twitter.png"), "Twitter", _MainPageURLs.twitter),
        _MainPageIconButton(AssetImage("assets/youtube.png"), "YouTube", _MainPageURLs.youtube)
      ]
    ),
    body: Center(child: widgets.elementAt(selectedPage)),
    bottomNavigationBar: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, semanticLabel: "About"),
          label: "About"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article, semanticLabel: "Projects"),
          label: "Projects"
        )
      ],
      currentIndex: selectedPage,
      onTap: (index) => setState(() => selectedPage = index)
    )
  );
}
