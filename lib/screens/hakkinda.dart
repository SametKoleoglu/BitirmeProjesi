import 'package:flutter/material.dart';

class Hakkinda extends StatefulWidget {
  Hakkinda({super.key});

  @override
  State<Hakkinda> createState() => _HakkindaState();
}

bool _iconBool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _HakkindaState extends State<Hakkinda> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // appBar bölgesinde bulunan karartıyı gidermek için
          title: Image.asset(
            "assets/100.png",
            fit: BoxFit.contain,
            width: 100,
            height: 75,
          ),

          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Drawer'ı açmak için
                },
              );
            },
          ),
          actions: [
            Image.asset(
              "assets/icon.gif", // Resminizin yolunu belirtin
              height: AppBar()
                  .preferredSize
                  .height, // AppBar'ın yüksekliği kadar yükseklik
              fit: BoxFit.cover, // Resmi tam kaplayacak şekilde boyutlandırın
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const Center(
                child: ListTile(
                  title: Text(
                    "Ayarlar",
                    style: TextStyle(fontSize: 23, color: Colors.red),
                  ),
                ),
              ),
              ListTile(
                title: IconButton(
                  onPressed: () {
                    setState(() {
                      _iconBool = !_iconBool;
                    });
                  },
                  icon: Icon(_iconBool ? _iconDark : _iconLight),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/arkaPlan.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '''
Bu uygulama,Kodluyoruz bünyesindeki Hi-Kod mobil atölyesi mezunları için bitirme projesi olarak yapılmıştır.
Cumhuriyetin bu önemli yılında ulu önder Mustafa Kemal Atatürk'ü ve tüm Türk halkını saygı ve minnetle anıyoruz..

                  ''',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
