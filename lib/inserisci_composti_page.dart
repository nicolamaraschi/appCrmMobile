import 'package:flutter/material.dart';

class InserisciCompostiPage extends StatelessWidget {
  const InserisciCompostiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserisci Composti'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contenuto della pagina di inserimento dei composti',
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
