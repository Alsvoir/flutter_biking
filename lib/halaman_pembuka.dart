import 'package:flutter/material.dart';
import 'package:flutter_biking/halaman_login.dart';

class HalamanPembuka extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/elemenatas.png',
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Image.asset(
                    'assets/biking2.png',
                    height: 250,
                    width: 150,
                  )
                ],
              )),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 260,
              ),
              const Text(
                "SELAMAT PAGI",
                style: TextStyle(
                  color: Color.fromARGB(255, 64, 173, 251),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 250,
                    height: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/welcome.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 460,
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisis mollis.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        Positioned(
          bottom: 160,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/elemenbawah.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ])),
    );
  }
}
