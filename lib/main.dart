import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Custom Painting Sample',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Custom Painting Sample"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new GestureDetector(
              onTap : () => showAlert(context),
              child: new CustomPaint(
                painter: new CustomObj(),
                size: Size(200.0, 400.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlert(BuildContext context){
    AlertDialog dialog = new AlertDialog(
      content: new Text("clicked"),
    );
    showDialog(context: context, builder: (_) => dialog);
    print('clicked custom render obj');
  }
}

class CustomObj extends CustomPainter {
  Path path = Path();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    var rect = Offset.zero & size;

    path.addRect(rect);
    path.close();

    canvas.drawShadow(path, Color.fromARGB(100, 122, 122, 122), 25.0, false);

    var gradient = new RadialGradient(
      center: const Alignment(0.0, -0.0),
      radius: 0.2,
      colors: [Colors.cyan, Colors.white],
      stops: [0.4, 1.0],
    );

    canvas.drawRect(
      rect,
      new Paint()..shader = gradient.createShader(rect),
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomObj oldDelegate) => false;
}