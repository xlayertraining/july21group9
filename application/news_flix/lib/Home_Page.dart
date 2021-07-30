import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomePage2 extends StatefulWidget {

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.pink,
            title: Text("Home Page", style: TextStyle(color: Colors.white,
                fontSize: 20.0, fontWeight: FontWeight.bold),)),
        body: Builder(
          builder: (context) =>
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(horizontal: 32),
                child:
                Text(" NEWS MAX", style: TextStyle(fontStyle: FontStyle.italic,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(
                    color: Colors.black87,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
        )
    );
  }
  }
  class catagoryTile extends StatelessWidget {
    const catagoryTile({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Container(
        child: Stack(
          children: [
          Image.asset("assets/news.png",width: 120,height: 60,
          )
          ],
        ),
      );
    }
  }

