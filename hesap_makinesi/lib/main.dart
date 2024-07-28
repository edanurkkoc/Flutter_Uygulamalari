import 'package:flutter/material.dart';




void main(){
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hesap makinesi",
      home: Iskele(),
    );
  }
}
class Iskele extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basit Hesap Makinesi"),),
      body: AnaEkran(),
    );

  }
}

class AnaEkran extends StatefulWidget {

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {

  num sayi1=0,sayi2=0,sonuc=0;

  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  toplama(){
    setState(() {
      sayi1=num.parse(t1.text);
      sayi2=num.parse(t2.text);
      sonuc=sayi1+sayi2;
    });

  }
  cikarma(){
    setState(() {
      sayi1=num.parse(t1.text);
      sayi2=num.parse(t2.text);
      sonuc=sayi1-sayi2;
    });

  }
  carpma(){
    setState(() {
      sayi1=num.parse(t1.text);
      sayi2=num.parse(t2.text);
      sonuc=sayi1 * sayi2;
    });

  }
  bolme(){
    setState(() {
      sayi1=num.parse(t1.text);
      sayi2=num.parse(t2.text);
      sonuc=sayi1 / sayi2;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50.0),
      child: Center(
        child: Column(
          children:[Text(sonuc.toString()),
            TextField(controller: t1,),
            TextField(controller: t2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed:toplama, child: Text("Toplama İşlemi"),),
                ElevatedButton(onPressed: cikarma, child: Text("Çıkarma İşlemi"),),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed: carpma, child: Text("Çarpma İşlemi"),),
                ElevatedButton(onPressed: bolme, child: Text("Bölme İşlemi"),),
              ],
            ),
          ] ,

        ),
      ),
    );
  }
}