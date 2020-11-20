import 'package:flutter/material.dart';
import 'package:todo_app/database.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 6),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/back_arrow_icon.png'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) async {
                              if (value != '') {
                                DatabaseHelper _dbHelper = DatabaseHelper();

                                Task _newTask = Task(title: value);

                                await _dbHelper.inserTask(_newTask);
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Enter Task Title",
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF211551),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter decription of your task",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      ),
                    ),
                  ),
                  Todo(
                    isDone: false,
                  ),
                  Todo(
                    isDone: true,
                  ),
                ],
              ),
              Positioned(
                bottom: 24,
                right: 24,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TaskPage(),),);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: AssetImage('assets/images/delete_icon.png'),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFE3577),
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
