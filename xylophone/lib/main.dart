import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audio_cache.dart';

void main() {
  runApp(
    MaterialApp(
      home: XylophoneApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playsound(int soundno) {
    AudioCache().play('audio$soundno.wav');
  }

  Widget buildKey(int soundno, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 50,
        hoverColor: Colors.grey,
        color: Colors.transparent,
      splashColor:  Colors.pink,
        shape:CircleBorder(side: BorderSide(color: Colors.black)),
        onPressed: () {
          playsound(soundno);
        },
        child: CustomPaint(
          painter: LinePainter(),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width:7.0,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 5,
                  ),
                ),
              ),
              Expanded(child: Center(child: Text('$text',style: TextStyle(color: Colors.white,fontSize: 15 ),))),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 7.0,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'assets/images/music.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(1, 'Do'),
                buildKey(2, 'Re'),
                buildKey(3, 'Mi'),
                buildKey(4, 'Fa'),
                buildKey(5, 'La'),
                buildKey(6, 'So'),
                buildKey(7, 'Si'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Define the positions of the circles and lines
    final double start1X = 30;
    final double start2X = size.width - 30;
    final double circleY = centerY;
    final double lineY = centerY - 3;

    // Draw lines between the circles
    canvas.drawLine(Offset(start1X, lineY), Offset(start2X, lineY), paint);

    // Draw circles at the ends of the lines
    canvas.drawCircle(Offset(start1X, circleY), 7, paint);
    canvas.drawCircle(Offset(start2X, circleY), 7, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
