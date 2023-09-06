import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF03A9F4),
      body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: screenHeight * 0.3),
              const Text(
                "Hitori",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(height: screenHeight * 0.025),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child:  Container (
                  height: screenHeight * 0.15,
                  width: screenHeight * 0.15,
                  child: const Image(
                    image: AssetImage('assets/hitori-game.png'),
                  ),
                ),
              ),
              Container(height: screenHeight * 0.1),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.07,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/game',
                    );
                  },
                  child: const Text(
                    'Play',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
