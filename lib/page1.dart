import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Text('Contenuto della pagina 1'),
      ),
    );
  }
}


// Definisci altre pagine in modo simile per '/page2', '/page3', ecc.
