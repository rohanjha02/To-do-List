import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoAppMainScreen(),
    );
  }
}
class ToDoAppMainScreen extends StatefulWidget {
  const ToDoAppMainScreen({super.key});

  @override
  State<ToDoAppMainScreen> createState() => _ToDoAppMainScreenState();
}

class _ToDoAppMainScreenState extends State<ToDoAppMainScreen> {
  List<String> _tasks = ['buy groceries', 'clean table', 'send emails'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To DO App'),
      ),
        body: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_tasks[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _tasks.removeAt(index);
                  });
                }
            ));
          }),
          floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),

      );
  }





void _addTask() {
    String newTask = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            onChanged: (value) {
              newTask = value;
            },
            onSubmitted: (_) {
              _submitTask(newTask);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _submitTask(newTask);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _submitTask(String newTask) {
    if (newTask.isNotEmpty) {
      setState(() {
        _tasks.add(newTask);
      });
      Navigator.pop(context);
    }
  }



}