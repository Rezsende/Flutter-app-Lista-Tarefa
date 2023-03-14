import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todoapp/models/todoModel.dart';
import 'package:todoapp/todo.dart';

import 'constantes/color.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({
    super.key,
  });

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final todolist = TodoModel.todolist();
  final todoControle = TextEditingController();

  List<TodoModel> buscaTodo = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buscaTodo = todolist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyC,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Lista de Tarefas",
          style: TextStyle(color: blackC, fontWeight: FontWeight.bold),
        ),
        backgroundColor: greyC,
      ),
      body: Stack(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      onChanged: (value) => filterTodo(value),
                      decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 13),
                          prefixIcon: Icon(
                            Icons.search,
                            color: blackC,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          hintText: "Pesquisar",
                          hintStyle: TextStyle(color: greyC)),
                    ),
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 30),
                        child: const Text("Tarefas de Hoje!",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      for (TodoModel todo in buscaTodo)
                        TodoItem(
                          todo: todo,
                          ontodoselet: todoSelect,
                          ondelete: deleteItem,
                        ),
                    ],
                  ))
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.00,
                              spreadRadius: 0.0)
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: todoControle,
                      decoration: InputDecoration(
                          hintText: 'Digite....', border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      addTask(todoControle.text);
                    },
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: pupleC,
                        minimumSize: Size(60, 60),
                        elevation: 10),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void filterTodo(String keywordsd) {
    List<TodoModel> result = [];
    if (keywordsd.isEmpty) {
      result = todolist;
    } else {
      result = todolist
          .where(
            (item) =>
                item.todotext!.toLowerCase().contains(keywordsd.toLowerCase()),
          )
          .toList();

      setState(() {
        buscaTodo = result;
      });
    }
  }

  void addTask(String toDo) {
    setState(() {
      todolist.add(TodoModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todotext: toDo));
    });

    todoControle.clear();
  }

  void deleteItem(String id) {
    setState(() {
      todolist.removeWhere((e) => e.id == id);
    });
  }

  void todoSelect(TodoModel todo) {
    setState(() {
      todo.isdone = !todo.isdone;
    });
  }
}
