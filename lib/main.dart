import 'package:flutter/material.dart';
import 'inserisci_composti_page.dart';
import 'lista_composti_page.dart';
import 'modifica_composto_page.dart';
import 'ricerca_avanzata_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Buttons Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const MyHomePage());
          case '/inserisci':
            return MaterialPageRoute(builder: (context) => InserisciCompostiPage());
          case '/listaComposti':
            return MaterialPageRoute(builder: (context) => ListaCompostiPage());
          case '/modificaComposto':
            return MaterialPageRoute(builder: (context) => ModificaCompostoPage());
          case '/ricercaAvanzata':
            return MaterialPageRoute(builder: (context) => RicercaAvanzataPage());
          default:
            return null;
        }
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Buttons Example'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: <Widget>[
          _buildAPIButton(context, 'Inserisci', '/inserisci'),
          _buildAPIButton(context, 'Lista Composti', '/listaComposti'),
          _buildAPIButton(context, 'Modifica Composto', '/modificaComposto'),
          _buildAPIButton(context, 'Ricerca Avanzata', '/ricercaAvanzata'),
        ],
      ),
    );
  }

  Widget _buildAPIButton(BuildContext context, String buttonText, String routeName) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Text(buttonText),
    );
  }
}
