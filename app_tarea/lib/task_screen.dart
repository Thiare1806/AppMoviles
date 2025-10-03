import 'package:app_tarea/controller/task_controller.dart';
import 'package:app_tarea/widgets/taskWidgets/filter_menu_button.dart';
import 'package:app_tarea/widgets/taskWidgets/new_task_fab.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late final TaskController _ctrl;
  @override
  void initState() {
    super.initState();
    _ctrl = TaskController();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) {
        final items = _ctrl.filtered;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Tareas"),
            actions: [
              FilterMenuButton(value: _ctrl.filter, onChanged: _ctrl.setFilter),
            ],
          ),
          floatingActionButton: NewTaskFab(
            onSubmit: (title, note, due) =>
                _ctrl.add(title, note: note, due: due),
            onCreated: (ctx) => ScaffoldMessenger.of(
              ctx,
            ).showSnackBar(const SnackBar(content: Text("Tarea creada"))),
          ),
        );
      },
    );
  }
}
