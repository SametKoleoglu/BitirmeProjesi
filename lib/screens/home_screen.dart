import 'package:flutter/material.dart';
import 'package:yuzuncu_yil/screens/anket.dart';
import 'package:yuzuncu_yil/screens/detail_screen.dart';
import 'package:yuzuncu_yil/screens/hakkinda.dart';
import 'package:yuzuncu_yil/utils/veriables.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
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

class _HomeScreenState extends State<HomeScreen> {
  bool _isPlaying = true;

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
            foregroundColor: Colors.black,
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
                ListTile(
                  contentPadding:
                      const EdgeInsets.all(16), // İçerik boşluğunu ayarlayın
                  leading: const Icon(
                    Icons.info, // Bilgi ikonu
                    color: Colors.red, // Simgenin rengini belirtin
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Hakkinda(), // Hakkında sayfasına yönlendirme
                    ));
                  },
                  title: const Text(
                    "Uygulama Hakkında",
                    style: TextStyle(fontSize: 16), // Yazının stilini ayarlayın
                  ),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: Veriables().listItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              listItem: Veriables().listItems[index],
                            ), // DetailScreen'a bilgiyi ileterek git
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                const BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 5,
                                  spreadRadius: 0.5,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  offset: const Offset(-2.0, -2.0),
                                  blurRadius: 1,
                                  spreadRadius: 0.3,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                Veriables().listItems[index][0],
                                // fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        // child: ImageCard(Veriables().listItems[index][0]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      // Butona tıklandığında başka bir sayfaya yönlendirin.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnketScreen()),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                          'Günümüz Türkiye\'sini ve gelecekteki Türkiye\'yi nasıl görüyorsunuz?'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
