import 'package:flutter/material.dart';
import 'package:todo_app/screen/taskpage.dart';
import 'package:todo_app/widgets.dart';
import 'package:flutter/widgets.dart';


class Homepage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24,),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 32,top: 32),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: NoGlow(),
                      child: ListView(
                        children: [
                          TaskCard(),
                          TaskCard(),
                          TaskCard(),
                          TaskCard(),
                          TaskCard(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 24,
                right: 0,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TaskPage(),),);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: AssetImage('assets/images/add_icon.png'),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF7349FE),
                          Color(0xFF643FDB),
                        ],
                        begin: Alignment(0,-1),
                        end: Alignment(0,1),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
