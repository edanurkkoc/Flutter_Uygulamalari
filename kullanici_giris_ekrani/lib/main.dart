import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:"/",
      routes:{
        "/":(context)=>GirisEkrani(),
        "/ProfilSayfasiRotasi":(context)=>ProfilEkrani(),
      },
    );
  }
}

class GirisEkrani extends StatefulWidget {


  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();

  girisYap(){
    if(t1.text=="admin" && t2.text=="1234"){
      Navigator.pushNamed(context, "/ProfilSayfasiRotasi",arguments: VeriModeli(kullaniciAdi:t1.text,sifre:t2.text),);
    }
    else {
      showDialog(
          context: context,
          builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Yanlış kullanıcı adı veya şifre"),
          content: new Text("Lütfen giriş bilgilerinizi gözden geçirin"),
          actions: [
            new ElevatedButton(onPressed:(){
              Navigator.of(context).pop();
            },
              child: new Text("Kapat"),),
          ],
        );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giriş Sayfası"),),
      body:Center(
        child :Container(
          margin: EdgeInsets.all(100.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Kullanıcı Adı"),
                controller:t1 ,),
              TextFormField(
                decoration: InputDecoration(hintText: "Şifre"),
                controller: t2,),
              ElevatedButton(onPressed: girisYap, child: Text("Giris Yap"),),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilEkrani extends StatefulWidget {


  @override
  State<ProfilEkrani> createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  cikisYap(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    VeriModeli iletilenArgumanlar=ModalRoute.of(context)!.settings.arguments as VeriModeli;


    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Ekrani"),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: cikisYap, child: Text("Cıkıs Yap"),),
            Text(iletilenArgumanlar.kullaniciAdi),
            Text(iletilenArgumanlar.sifre),
          ],

        ),
      ),
    );
  }
}
/*VERİ AKTARIMI*/

class VeriModeli{
  String kullaniciAdi,sifre;
  VeriModeli({required this.kullaniciAdi, required this.sifre,});
}
