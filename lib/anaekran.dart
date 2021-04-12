import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController t1 = TextEditingController();
  List alisverisListesi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: alisverisListesi.length,
                itemBuilder: (context, indeksNumarasi) => ListTile(
                  title: Text(alisverisListesi[indeksNumarasi]),
                  subtitle: Text("Alışveriş Malzemeleri"),
                ),
              ),
            ),
            TextField(
              controller: t1,
            ),
            ElevatedButton(
              onPressed: elemanEkle,
              child: Text("Ekle"),
            ),
            ElevatedButton(
              onPressed: elemanCikar,
              child: Text("Çıkar"),
            )
          ],
        ),
      ),
    );
  }

  void elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  void elemanCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }
}
