import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_restaurant/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 239, 219),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            //shop name
            Text(
              "sushi man",
              style: GoogleFonts.poppins(
                fontSize: 28,
                color: Color(0xFF638889),
              ),
            ),

            //icon
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('lib/images/sushi.png'),
            ),

            //title
            Text(
              "The Taste of Japanese Food",
              style: GoogleFonts.poppins(
                fontSize: 34,
                color: Color(0xFF638889),
              ),
            ),

            //subtitle
            // ignore: prefer_const_constructors
            const SizedBox(height: 20),
            Text(
              "Feel the taste of the most popular japanese food from anywhere and anytime",
              style: TextStyle(
                color: Color(0xFF88AB8E),
                height: 2,
                fontSize: 15,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // get start
            MyButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/menuPage');
              },
            )
          ],
        ),
      ),
    ); //scaffold
  }
}
