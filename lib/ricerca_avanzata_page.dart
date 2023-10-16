import 'package:flutter/material.dart';

class RicercaAvanzataPage extends StatelessWidget {
  const RicercaAvanzataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ricerca Avanzata'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contenuto della pagina di ricerca avanzata',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Torna alla Home'),
            ),
          ],
        ),
      ),
    );
  }
}
