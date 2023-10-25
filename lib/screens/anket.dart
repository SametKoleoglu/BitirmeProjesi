import 'package:yuzuncu_yil/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:yuzuncu_yil/screens/hakkinda.dart';
import 'package:reviews_slider/reviews_slider.dart';

class AnketScreen extends StatefulWidget {
  @override
  State<AnketScreen> createState() => _AnketScreenState();
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

class _AnketScreenState extends State<AnketScreen> {
  int selectedValue = 1;

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
                  fit: BoxFit
                      .cover, // Resmi tam kaplayacak şekilde boyutlandırın
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  Center(
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
                  ListTile(
                    leading: Icon(Icons.info), // Bilgi ikonu
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Hakkinda(), // Hakkında sayfasına yönlendirme
                      ));
                    },
                    title: Text("Uygulama Hakkında"),
                    iconColor: Colors.red,
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "-Türkiye Yüzyılı hakkında genel olarak neler düşünüyorsunuz?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Cevabınız..."),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "-Gelecekteki Türkiye hakkında neler düşünüyorsunuz?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Cevabınız..."),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "-Türkiyenin teknoloji alanındaki durumu hakkında neler düşünüyorsunuz?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Cevabınız..."),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "-Bireysel olarak teknoloji ile ilgileniyor musunuz?(Hangi Alanda)",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Cevabınız..."),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "-Sizce Ülkemizde daha çok değer verilmesi gereken şeyler neler?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Cevabınız..."),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "-Daha iyi bir Türkiye için neler yapıyorsunuz,yapmak istiyorsunuz?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Cevabınız..."),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Uygulama Hakkındaki Düşünceniz",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ReviewSlider(
                      onChange: onChange1,
                      optionStyle: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                      options: ['Çok Kötü', "Kötü", "Orta", "İyi", "Çok İyi"],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // "Gönder" butonuna tıklanınca çalışacak kod
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Cevaplarınız İletildi :)'),
                                actions: <Widget>[
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Dialog'u kapat
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(),
                                        ),
                                      );
                                    },
                                    child: Text('Tamam'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Gönder'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void onChange1(int index) {
    setState(() {
      selectedValue = index;
    });
  }
}

class SoruWidget extends StatelessWidget {
  final String soruNo;
  final String soruMetni;
  final String cevapLabel;

  SoruWidget(this.soruNo, this.soruMetni, this.cevapLabel);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            soruNo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            soruMetni,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: cevapLabel,
          ),
        ),
      ),
    );
  }
}
