import 'package:flutter/material.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Chat Uygulaması Arayüzü",
      home: Iskele(),
    );
  }
}
class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Uygulaması"),
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

  List<MesajBalonu> mesajListesi=[];

  listeyeEkle(String gelenMesaj){
    setState(() {
      MesajBalonu mesajNesnesi =MesajBalonu(mesaj:gelenMesaj);
      mesajListesi.insert(0 ,mesajNesnesi);
      t1.clear();
    });
  }
  Widget metinGirisAlani(){
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Row(children: [
        Flexible(child: TextField(
          controller: t1,
        ),),

        IconButton(onPressed:()=> listeyeEkle(t1.text), icon: Icon(Icons.send,))
      ],),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
        Flexible(child: ListView.builder(
          reverse: true,
            itemCount: mesajListesi.length,
            itemBuilder: (_,indeksNumarasi)=>
            mesajListesi[indeksNumarasi]),
        ),
        Divider(
          thickness: 1,
          ),
          metinGirisAlani(),
        ],

      ),

    );
  }
}
String isim="Kullanıcı1";


class MesajBalonu extends StatelessWidget {


  var mesaj;
  MesajBalonu({required this.mesaj});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 15) ,
      child: Row(
        children: [
          CircleAvatar(child: Text(isim[0]),),
          Column(
            children: [
              Text(isim),
              Text(mesaj),
            ]

          ),
        ],
      ),
    );
  }
}






















