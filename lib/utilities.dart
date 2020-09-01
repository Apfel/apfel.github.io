// ignore: avoid_web_libraries_in_flutter
import "dart:js" as JavaScript;
import "package:flutter/material.dart";

class Utilities {
  static void showURLDialog(BuildContext context, String url, String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("You're now opening " + name + ".\n\nURL: \"" + url + "\""),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop()
            ),
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                JavaScript.context.callMethod("open", [url]);
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
    );
  }
}
