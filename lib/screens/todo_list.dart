import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _todoTextEditingController = TextEditingController();
  final _focusNode = FocusNode();
  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: _focusNode,
                    autofocus: true,
                    controller: _todoTextEditingController,
                    decoration: const InputDecoration(
                      label: Text("To-Do"),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        todos.add(value);
                      });

                      _todoTextEditingController.text = "";
                      _focusNode.requestFocus();
                    },
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      todos.add(_todoTextEditingController.text);
                    });

                    _todoTextEditingController.text = "";
                    _focusNode.requestFocus();
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return ListTile(
                    title: Text(todo),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.delete_outlined),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
