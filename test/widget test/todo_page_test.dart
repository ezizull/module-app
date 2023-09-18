import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TodoList UI elements', (WidgetTester tester) async {
    // Build the TodoList widget
    await tester.pumpWidget(TodoPage());

    // Verify if the app title is displayed
    expect(find.text('Todo List'), findsOneWidget);

    // Verify if the TextField is displayed
    expect(find.byType(TextField), findsOneWidget);

    // Verify if the FloatingActionButton is displayed
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Adding and removing todos', (WidgetTester tester) async {
    // Build the TodoList widget
    await tester.pumpWidget(TodoPage());

    // Add a todo
    await tester.enterText(find.byType(TextField), 'Test Todo');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    // Verify if the added todo is displayed
    expect(find.text('Test Todo'), findsOneWidget);

    // Swipe to delete the todo
    await tester.drag(find.text('Test Todo'), const Offset(500.0, 0.0));
    await tester.pumpAndSettle();

    // Verify if the todo is removed
    expect(find.text('Test Todo'), findsNothing);
  });
}

class TodoPage extends StatefulWidget {
  // const TodoList({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  static const _appTitle = 'Todo List';
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_appTitle),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return Dismissible(
                    key: Key('$todo$index'),
                    onDismissed: (direction) => todos.removeAt(index),
                    background: Container(color: Colors.red),
                    child: ListTile(title: Text(todo)),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              todos.add(controller.text);
              controller.clear();
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}