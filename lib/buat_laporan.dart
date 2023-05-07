import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class BuatLaporan extends StatefulWidget {
  @override
  _BuatLaporanState createState() => _BuatLaporanState();
}

class _BuatLaporanState extends State<BuatLaporan> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;
  String? _kelas;
  String? _nama;
  String? _masalah;
  TextEditingController kelasController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController masalahController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();

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

  Future<void> _submitForm() async {
    final response = await http.post(Uri.parse('http://localhost:3000/report'), body: {
      'kelas': kelasController.text,
      'nama': namaController.text,
      'masalah': masalahController.text,
      'tanggal': tanggalController.text,
    });

    if (response.statusCode == 200) {
      // handle success
      print('Report submitted successfully!');
    } else {
      // handle error
      print('Error submitting report!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pelaporan'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
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
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 3.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
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
                                padding: const EdgeInsets.only(
                                    left: 7.0, right: 8.0),
                                child: Column(children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  TextFormField(
                                    controller: kelasController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 16.0,
                                        horizontal: 10.0,
                                      ),
                                      hintText: 'Masukkan kelas',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Kelas harus diisi';
                                      }
                                      return null;
                                    },
                                  ),
                                ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text(
                                  "Nama",
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
                                padding: const EdgeInsets.only(
                                    left: 7.0, right: 8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 3,
                                    ),
                                    TextFormField(
                                      controller: namaController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 16.0,
                                          horizontal: 10.0,
                                        ),
                                        hintText: 'Masukkan nama',
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Nama harus diisi';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text(
                                  "Masalah yang sedang dialami/dirasakan",
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
                                padding: const EdgeInsets.only(
                                    left: 7.0, right: 8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 3,
                                    ),
                                    TextFormField(
                                      controller: masalahController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 60.0, // ubah nilai vertical
                                          horizontal: 10.0,
                                        ),
                                        hintText: 'Masukkan masalah',
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Masalah harus diisi';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text(
                                  "Tanggal Laporan",
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
                                padding: const EdgeInsets.only(
                                    left: 7.0, right: 8.0),
                                child: Column(children: [
                                  SizedBox(
                                    height: 3,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      DatePicker.showDatePicker(
                                        context,
                                        showTitleActions: true,
                                        minTime: DateTime(2022, 1, 1),
                                        maxTime: DateTime(2023, 12, 31),
                                        onConfirm: (date) {
                                          // tangkap tanggal yang dipilih
                                        },
                                        currentTime: DateTime.now(),
                                        locale: LocaleType.id,
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0)),
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 16.0,
                                            horizontal: 10.0,
                                          ),
                                          hintText: 'Pilih tanggal laporan',
                                        ),
                                          // simpan tanggal yang dipilih
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          _submitForm();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Sukses'),
                                  ],
                                ),
                                content: Text('Laporan anda berhasil dikirim'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Kirim",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
