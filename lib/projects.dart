
import "package:flutter/material.dart";
import "package:stuff/github.dart";
import "package:stuff/utilities.dart";

class Project extends StatelessWidget {
  final GitHubRepository project;

  Project(this.project);

  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.all(32),
    child: InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 60,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(project.name, textScaleFactor: 2, style: Theme.of(context).textTheme.caption),
                  Expanded(flex: 3, child: Container()),
                  Text(project.description, textScaleFactor: 1.2, style: Theme.of(context).textTheme.caption),
                  Expanded(flex: 3, child: Container()),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(" " + project.language, textScaleFactor: 0.95, style: Theme.of(context).textTheme.subtitle1)
                    ]
                  )
                ]
              )
            )
          )
        ]
      ),
      onTap: () => Utilities.showURLDialog(context, project.url, project.name),
    )
  );
}

class ProjectsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTextStyle(
    style: Theme.of(context).textTheme.bodyText2,
    child: FutureBuilder(
      future: fetchRepositoriesForUser("Apfel"),
      builder: (BuildContext context, AsyncSnapshot<List<GitHubRepository>> snapshot) {
        if (!snapshot.hasData) return Center(child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(semanticsLabel: "Project loading indicator"),
            Text("Loading projects...")
          ]
        ));

        return GridView.count(
          padding: EdgeInsets.all(16),
          crossAxisCount: 3,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.3),
          children: List.generate(
            snapshot.data.length,
            (index) => Project(snapshot.data[index])
          )
        );
      }
    )
  );
}