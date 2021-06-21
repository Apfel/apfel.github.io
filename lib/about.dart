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

import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "base.dart";

class AboutTab extends NamedWidget {
  @override
  String getName() => "about";

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.all(8),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AutoSizeText(
            """Hello! My name is Marko. You may instead know me as Apfel.

I'm a hobbyist software developer.

I try to tackle every challenge I come across, though I prefer desktop-oriented application development.
You may want to check the projects I've worked on out - in that case, switch over to the Projects tab.

You can use any of the buttons in the top right corner to find me on various social media platforms.""",
            style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
      ]));
}
