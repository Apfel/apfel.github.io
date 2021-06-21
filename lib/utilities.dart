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

// ignore: avoid_web_libraries_in_flutter
import "dart:js" as JavaScript;
import "package:flutter/material.dart";

class Utilities {
  static void showURLDialog(BuildContext context, String url, String name) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Text(
                  "You're now opening " + name + ".\n\nURL: \"" + url + "\""),
              actions: <Widget>[
                TextButton(
                    child: Text("Cancel"),
                    onPressed: () => Navigator.of(context).pop()),
                TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      JavaScript.context.callMethod("open", [url]);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }
}
