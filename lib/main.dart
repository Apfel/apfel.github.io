import "package:flutter/material.dart";
import "package:stuff/about.dart";
import "package:stuff/projects.dart";
import "package:stuff/utilities.dart";

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
