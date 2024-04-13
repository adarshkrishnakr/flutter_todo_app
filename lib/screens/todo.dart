import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<Map<String, dynamic>> todoList = [];

  TextEditingController _textEditingController = TextEditingController();

  addList() {
    setState(() {
      String value = _textEditingController.text;
      if (value.isNotEmpty) {
        todoList.add({"value": value});
        _textEditingController.clear(); 
      }
    });
  }

  deleteTask(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 57, 57, 57),
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "TODO APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu))),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 90,
                child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.green[700],
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 80,
                                    child: Text(
                                      todoList[index]['value'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Expanded(
                                    flex: 20,
                                    child: TextButton(
                                      onPressed: () {
                                        deleteTask(index);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 70,
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                fillColor: Colors.green[300],
                                filled: true,
                                labelText: "Create Task.....",
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: 5,
                        )),
                    Expanded(
                        flex: 27,
                        child: ElevatedButton(
                            onPressed: () {
                              addList();
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  Colors.black, 
                              backgroundColor:
                                  Colors.green, 
                            ),
                            child: Container(
                                height: 15,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text("Add")))),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}