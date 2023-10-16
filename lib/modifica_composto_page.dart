import 'package:flutter/material.dart';

class ModificaCompostoPage extends StatelessWidget {
  const ModificaCompostoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifica Composto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contenuto della pagina di modifica dei composti',
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
