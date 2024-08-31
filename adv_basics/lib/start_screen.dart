import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(void Function() this.startQuiz,{super.key});

  final void Function() startQuiz;


  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/gibi_photo_1.png',
            width: 400,
          ),
          const SizedBox(
            height: 40,
          ),
           Text(
            'Kimsenin hiçbir şey bilmediği yer',
            style: GoogleFonts.lato(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(196, 192, 192, 1),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              onPressed:startQuiz, 
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon:Icon(Icons.play_arrow, color: Colors.white,),
              label: Text('Cevaplamaya Başla')),
        ],
      ),
    );
  }
}
