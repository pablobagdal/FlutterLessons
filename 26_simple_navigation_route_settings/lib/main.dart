import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

void main() {
  runApp(
    MaterialApp(
        title: 'Passing Data',
        home: TodosScreen(
          todos: List.generate(
            20,
            (index) => Todo('$index todo', 'description for $index'),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/detailscreen': (context) => DetailScreen(),
          // '/page2': (context) => Page2(),
        }),
  );
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.pushNamed(context, '/detailscreen',
                  arguments: todos[index]);
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  late Todo todo;
  // In the constructor, require a Todo.
  // const DetailScreen({
  //   super.key,
  //   /*required this.todo*/
  // });

  // Declare a field that holds the Todo.
  // final Todo todo;

  @override
  Widget build(BuildContext context) {
    // final Todo todo = ModalRoute.of(context)!.settings.arguments as Todo;
    RouteSettings settings = ModalRoute.of(context)!.settings;
    todo = settings.arguments as Todo;

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
