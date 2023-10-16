import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListaCompostiPage extends StatefulWidget {
  const ListaCompostiPage({Key? key}) : super(key: key);

  @override
  _ListaCompostiPageState createState() => _ListaCompostiPageState();
}

class _ListaCompostiPageState extends State<ListaCompostiPage> {
  List<Map<String, dynamic>> composti = [];
  bool isLoading = true;
  String error = "";

  @override
  void initState() {
    super.initState();
    getComposti();
  }

  void getComposti() async {
    try {
      final response = await http.get(Uri.parse("http://192.168.1.2:8080/api/listaComposti"));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          composti = data.cast<Map<String, dynamic>>();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          error = "Errore durante il recupero dei composti chimici.";
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        error = "Errore durante il recupero dei composti chimici: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Composti'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contenuto della pagina di elenco dei composti',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Torna alla Home'),
            ),
            if (isLoading)
              CircularProgressIndicator()
            else if (error.isNotEmpty)
              Text(error)
            else
              Expanded(
                child: SingleChildScrollView(
                  child: CompostiTable(composti),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CompostiTable extends StatelessWidget {
  final List<Map<String, dynamic>> composti;

  CompostiTable(this.composti);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              TableCellText('ID', isHeader: true),
              TableCellText('Nome', isHeader: true),
              TableCellText('Formula Chimica', isHeader: true),
              TableCellText('Peso Molecolare', isHeader: true),
              TableCellText('Quantità Disponibile', isHeader: true),
              TableCellText('Note', isHeader: true),
              TableCellText('Data di Scadenza', isHeader: true),
            ],
          ),
          for (final composto in composti)
            TableRow(
              children: [
                TableCellText(composto['id'].toString()),
                TableCellText(composto['nome']),
                TableCellText(composto['formulaChimica']),
                TableCellText(composto['pesoMolecolare'].toStringAsFixed(2)),
                TableCellText(composto['quantitaDisponibile'].toStringAsFixed(2)),
                TableCellText(composto['note']),
                TableCellText(composto['dataScadenza']),
              ],
            ),
        ],
      ),
    );
  }
}

class TableCellText extends StatelessWidget {
  final String text;
  final bool isHeader;

  const TableCellText(this.text, {Key? key, this.isHeader = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
