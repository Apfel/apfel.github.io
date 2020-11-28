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

import 'package:apfel_github_io/base.dart';
import "package:flutter/material.dart";
import "github.dart";
import "utilities.dart";

class _Project extends StatelessWidget {
  final GitHubRepository project;

  _Project(this.project);

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      title: Text(project.name, style: Theme.of(context).textTheme.subtitle1),
      subtitle: Text(project.description),
      trailing: Text(
        project.language, 
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.subtitle2
      ),
      onTap: () => Utilities.showURLDialog(context, project.url, "GitHub > " + project.name),
    )
  );
}

class ProjectsTab extends NamedWidget{
  @override
  String getName() => "projects";

  @override
  Widget build(BuildContext context) => DefaultTextStyle(
    style: Theme.of(context).textTheme.bodyText2,
    child: FutureBuilder(
      future: fetchRepositoriesForUser("Apfel"),
      builder: (BuildContext context, AsyncSnapshot<List<GitHubRepository>> snapshot) {
        if (!snapshot.hasData) return Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(semanticsLabel: "Project loading indicator"),
              Text("Loading projects...")
            ]
          )
        );

        return Scrollbar(
          child: ListView(
            padding: EdgeInsets.all(8),
            children: List.generate(
              snapshot.data.length,
              (index) => _Project(snapshot.data[index])
            )
          )
        );
      }
    )
  );
}
