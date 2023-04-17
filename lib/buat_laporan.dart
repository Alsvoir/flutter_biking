import 'package:flutter/material.dart';

class BuatLaporan extends StatefulWidget {
  @override
  _BuatLaporanState createState() => _BuatLaporanState();
}
class _BuatLaporanState extends State<BuatLaporan> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Text('Beranda'),
    Text('Profil'),
    Text('Pelaporan'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prelaporan'),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Stack(
          children: [
            // Align(
            //         alignment: Alignment.topCenter,
            //         child: Container(
            //           padding: EdgeInsets.symmetric(vertical: 0, horizontal: 41),
            //           decoration: BoxDecoration(
            //             color: Color(0xFF38ACFF),
            //           ),
            //           width: double.infinity,
            //           height: 75,
            //           child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               Image.asset(
            //                 'assets/Back.png',
            //                 width: 20,
            //                 height: 20,
            //               ),
            //               SizedBox(
            //                 width: 10,
            //               ),
            //               const Text(
            //                 "Laporan Masalah",
            //                 style: TextStyle(
            //                   color: Color(0xFFFFFFFF),
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.w600,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
                   Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xFF000000).withOpacity(0.16),
                        width: 1.0,
                      ),
                    ),
                    width: 335,
                    height: 440,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 3.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text(
                                  "Kelas",
                                  style: TextStyle(
                                    color: Color(0xFF584D99),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: 
                                Column(
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xFF000000).withOpacity(0.16),
                        width: 1.0,
                      ),
                    ),
                    width: 300,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 11.0, left: 3.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text(
                                  "XII MIPA 1",
                                  style: TextStyle(
                                    color: Color(0xFF584D99),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                    )
                    ),
                  )
                ]
                
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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