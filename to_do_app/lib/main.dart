import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To Do Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alışveriş Listesi Uygulaması"),
      ),
      body: AnaEkran(),
    );
  }
}
class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1=TextEditingController();
  List alisverisListesi=[];
  elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }
  elemanCikar(){
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(child: ListView.builder(
            itemCount: alisverisListesi.length,
            itemBuilder: (context,indeksNumarasi)=>ListTile(
              subtitle: Text("Alışveriş Malzemeleri"),
              title: Text(alisverisListesi[indeksNumarasi]),
            ),

          ),),
          TextField(controller: t1,),
          ElevatedButton(onPressed: elemanEkle, child:Text (" Ekle"), ),
          ElevatedButton(onPressed: elemanCikar, child: Text("Çıkar"),),
        ],
      ),
    );
  }
}
