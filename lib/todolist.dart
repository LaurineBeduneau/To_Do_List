import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  TodoList({super.key});
  final TextEditingController todo = TextEditingController();
  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cards.addAll([
      mycard("Projet 1"),
      mycard("Projet 2\nJavaScript\nReact"),
      mycard("Projet 3"),
      mycard("Projet 4\nExpress Node.js\nReact"),
    ]);
  }

  void showalertdialog(TextEditingController? todo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: const Text(
          "Add task",
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: todo,
              autofocus: true,
              style: const TextStyle(
                fontSize: 18.0,
                fontFamily: "Raleway",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      cards.add(mycard(todo!.text.toString()));
                      setState(() {});
                    },
                    child: const Text(
                      "ADD",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteTask() {}

  Widget mycard(String task) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
            task,
            style: const TextStyle(
              fontSize: 18.0,
              fontFamily: "Ralway",
            ),
          ),
          onLongPress: () {
            print("Should Get Deleted");
          },
        ),
      ),
    );
  }

  List<Widget> cards = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showalertdialog(widget.todo),
          backgroundColor: Colors.yellow,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "To do List",
            style: TextStyle(
              fontFamily: "Raleway",
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: ListView.builder(
            itemCount: cards.length,
            itemBuilder: ((context, index) => cards[index])));
  }
}
