import 'package:flutter/material.dart';
import 'package:flutter_biking/pelaporan.dart';
import 'package:flutter_biking/tentang_kami.dart';
import 'package:flutter_biking/profil_page.dart';

class LongPage2 extends StatefulWidget {
  @override
  _LongPageState2 createState() => _LongPageState2();
}

class _LongPageState2 extends State<LongPage2> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[    Text('Beranda'),    Text('Profil'),    Text('Pelaporan'),  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }
  if (index == 2) { // Jika item yang diklik adalah "Pelaporan"
    _nextPage(); // Panggil fungsi _nextPage
  }
}
void _nextPage() {
  Navigator.push( // Navigasi ke halaman selanjutnya di sini
    context,
    MaterialPageRoute(builder: (context) => Pelaporan()),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Seputar BK'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Text(
                      'Bimbingan dan Konseling SMA Negeri 16 Makassar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Image.asset(
                      'assets/video_profil.png',
                      height: 200,
                      width: 500,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisis mollis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisis mollis.',
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Koordinator BK',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Image.asset(
                      'assets/orang.png',
                      height: 200,
                      width: 500,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Chris Evan',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisis mollis.”',
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Guru-Guru BK',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Image.asset(
                      'assets/orang.png',
                      height: 200,
                      width: 500,
                    ),
                    Text(
                      'Chris Evan',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Image.asset(
                      'assets/konsul.png',
                      height: 200,
                      width: 500,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Vsi Misi Kami',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      'assets/gambar_bawah.png',
                      height: 300,
                      width: 800,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: 'Pelaporan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
