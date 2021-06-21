// Copyright (c) 2020-2021 Apfel
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify and/or distribute copies of the Software.
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
import "base.dart";
import "github.dart";
import "utilities.dart";

class _Project extends StatelessWidget {
  final GitHubRepository project;

  _Project(this.project);

  @override
  Widget build(BuildContext context) => Card(
          child: ListTile(
        title: Builder(builder: (BuildContext context) {
          List<Widget> widgets = [];

          widgets.add(
              Text(project.name, style: Theme.of(context).textTheme.subtitle1));

          if (project.archived)
            widgets.addAll([
              Spacer(flex: 1),
              Text("archived",
                  style: TextStyle(color: Colors.grey, fontSize: 15)),
            ]);

          if (project.fork && project.parent != null)
            widgets.addAll([
              Spacer(flex: 1),
              Text("forked from ",
                  style: TextStyle(color: Colors.grey, fontSize: 15)),
              TextButton(
                  child: Text(project.parent.fullName,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15)),
                  onPressed: () => Utilities.showURLDialog(
                      context,
                      project.parent.url,
                      "GitHub > " + project.parent.fullName)),
            ]);

          if (project.archived || (project.fork && project.parent != null))
            widgets.add(Spacer(flex: 100));

          return Row(children: widgets);
        }),
        subtitle: Text(project.description),
        trailing: Text(project.language,
            style: Theme.of(context).textTheme.subtitle2),
        onTap: () => Utilities.showURLDialog(
            context, project.url, "GitHub > " + project.name),
      ));
}

class ProjectsTab extends NamedWidget {
  @override
  String getName() => "projects";

  @override
  Widget build(BuildContext context) => DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2,
      child: FutureBuilder(
          future: fetchRepositoriesForUser("apfel"),
          builder: (BuildContext context,
              AsyncSnapshot<List<GitHubRepository>> snapshot) {
            if (!snapshot.hasData)
              return Container(
                  padding: EdgeInsets.all(16),
                  child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                          semanticsLabel: "Project loading indicator")));

            return Scrollbar(
                child: ListView(
                    padding: EdgeInsets.all(8),
                    children: List.generate(snapshot.data.length,
                        (index) => _Project(snapshot.data[index]))));
          }));
}
