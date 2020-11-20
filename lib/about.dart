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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText("""Hello! My name is Marko.
You may instead know me as Apfel.

I'm a software developer.

I try to tackle every challenge I come across, though I prefer desktop-oriented application development.

You may want to check the projects I've worked on out - in that case, switch over to the Projects tab.""",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center
        )
      ]
    )
  );
}
/* Container(
    child: Text(
"""Hey, I'm Marko, probably better known by the username Apfel, and I develop stuff.
As long as it's a fun challenge - I'm up for it!  
My projects should give you a rough idea of what I've tried so far.  
With all that said - you can use the bar at the bottom to check out more stuff.
Have fun!"""
    )
  );
}
*/
