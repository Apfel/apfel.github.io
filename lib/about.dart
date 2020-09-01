import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Center(
      child: SizedBox(
        width: 680.0,
        height: 215.0,
        child: AutoSizeText("""Hey, I'm Marko, probably better known by the username Apfel, and I develop stuff.
As long as it's a fun challenge - I'm up for it!  
My projects should give you a rough idea of what I've tried so far.  
With all that said - you can use the bar at the bottom to check out more stuff.

Have fun!""",
          style: TextStyle(fontSize: 24),
          minFontSize: 16,
          maxFontSize: 80,
        )
      )
    )
  );
}
