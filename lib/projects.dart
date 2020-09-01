import "package:flutter/material.dart";
import "package:stuff/utilities.dart";

class ProjectElement {
  final String name;
  final String description;
  final String url;
  final String language;

  ProjectElement({
    @required
    this.name,

    @required
    this.description,

    @required
    this.url,

    @required
    this.language
  });
}

List<ProjectElement> elements = [
  ProjectElement(
    name: "DSiRC",
    description: "A simple yet quite broken IRC client made for the Nitendo DS and DSi.",
    url: "https://github.com/Apfel/DSiRC",
    language: "C / C++"
  ),
  ProjectElement(
    name: "gotag",
    description: "A JagTag port for Go, a library for machine-based text interpretation.",
    url: "https://github.com/Apfel/gotag",
    language: "Go"
  ),
  ProjectElement(
    name: "Nutty Nook",
    description: "The official Discord bot for The Nook Network.",
    url: "https://github.com/Apfel/Nutty-Nook",
    language: "Go"
  ),
  ProjectElement(
    name: "Ongaku for Windows",
    description: "Discord Rich Presence for iTunes.",
    url: "https://github.com/Apfel/Ongaku-Windows",
    language: "C++"
  ),
  ProjectElement(
    name: "openhmd-go",
    description: "An OpenHMD API wrapper for Go.",
    url: "https://github.com/Apfel/openhmd-go",
    language: "Go"
  )
];

class Project extends StatelessWidget {
  final ProjectElement element;

  Project(this.element);

  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
    child: InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 60,
            child: Container(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(element.name),
                  Text(element.description,
                    textScaleFactor: 1.2,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Text(element.language,
                    textScaleFactor: 0.9,
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ]
              )
            )
          )
        ]
      ),
      onTap: () => Utilities.showURLDialog(context, element.url, element.name),
    )
  );
}

class ProjectsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GridView.count(
    padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
    crossAxisCount: 3,
    childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.3),
    children: List.generate(
      elements.length,
      (index) => Project(elements[index])
    )
  );
}