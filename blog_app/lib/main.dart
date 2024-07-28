import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "İlkel Blog Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog Uygulaması"),
      ),
      body: AnaEkran( ),
    );
  }
}
class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
 String blogYazisi="Bloga Hos Geldiniz ";
 yaziGoster(){
   setState(() {
     blogYazisi="LKSDŞLAKŞDAŞNDŞANŞDŞAEMDŞADŞALDSŞLAMDLŞAMLŞ";
   });
 }
 yazi2Goster(){
   setState(() {
     blogYazisi="MAYIS BLOG YAZİSİ";
   });
 }
 yazi3Goster(){
   setState(() {
     blogYazisi="HAZİRAN BLOG YAZİSİ";
   });
 }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text (blogYazisi),
              ElevatedButton(onPressed: yaziGoster, child: Text('Bas LAN!'),),
              ElevatedButton(onPressed: yazi2Goster, child: Text('Nisan Blog Yazisi')),
              ElevatedButton(onPressed: yazi3Goster, child: Text('Mayıs Blog Yazisi')),
            ],
        ),
      ),

    );
  }
}
