import 'package:flutter/material.dart';
import 'package:to_do/model/todo.dart';
import 'package:to_do/screens/stack.dart';
import 'package:to_do/screens/widgets/search_box.dart';
import 'package:to_do/screens/widgets/to_do_boxes.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final toDolist = ToDo.toDoList();
  final _toDoController = TextEditingController();
  List<ToDo> _foundList = [];

  @override
  void initState() {
    _foundList = toDolist;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: _appBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            child: Column(
              children: [
                const SearchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: const Text(
                          'Justin To Do',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      for (ToDo todoo in _foundList)
                        ToDoBoxes(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _onDeletedItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _toDoController,
                      decoration: const InputDecoration(
                        hintText: 'Add a new To Do',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _addItem(_toDoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 50),
                      elevation: 10,
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 35,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _onDeletedItem(String id) {
    setState(() {
      toDolist.removeWhere((item) => item.id == id);
    });
  }

  void _addItem(String toDo) {
    setState(() {
      toDolist.add(
        ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            toDoText: toDo),
      );
    });
    _toDoController.clear();
  }

  void runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = toDolist;
    } else {
      results = toDolist
          .where((item) => item.toDoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundList = results;
    });
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFFEEEFF5),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StackScreen(),
              ));
            },
            child: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                  'https://opiniones.secretosdelavida.com/wp-content/uploads/2022/09/Secretos-de-la-Vida-Logo-Favicon.png'),
            ),
          )
        ],
      ),
    );
  }
}
