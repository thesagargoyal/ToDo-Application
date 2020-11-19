import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {

  final String title;
  final String description;
  TaskCard({this.title,this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32,horizontal: 24),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title??"(Unnamed Task)",
            style: TextStyle(
                color: Color(0xFF211551),
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              description??"No description added",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF868290),
                  height: 1.5
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Todo extends StatelessWidget {

  final String text;
  final bool isDone;

  Todo({this.text,@required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: isDone? Color(0xFF7349FE) : Colors.transparent,
              border: isDone ? null :Border.all(color: Color(0xFF868290),
              width: 1.5),
              borderRadius:BorderRadius.circular(6),
            ),
            child: Image(
              image: AssetImage(
                'assets/images/check_icon.png'
              ),
            ),
          ),
          Text(
            text??"No defined",
            style: TextStyle(
              color: isDone ? Colors.indigo : Color(0xFF868290),
              fontSize: 16,
              fontWeight: isDone ? FontWeight.bold : FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}

class NoGlow extends ScrollBehavior{

  @override
  Widget buildViewportChrome(
      BuildContext context,Widget child,AxisDirection axisDirection){
    return child;
  }

}
