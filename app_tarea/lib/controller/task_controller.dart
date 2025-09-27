// logica del controlador de la tarea (lo que va detras)
import 'package:app_tarea/models/task.dart';
import 'package:app_tarea/models/task_filter.dart';
import 'package:flutter/material.dart';

class TaskController extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      title: "Jugar de todo un poco",
      note: "Tengo muchas ganas de jugar",
      due: DateTime.now().add(const Duration(days: 2)),
    ),
    Task(
      title: "Llevar a mi perrita al veterinario",
      note: "Hay que llevarlo a control",
      due: DateTime.now().add(const Duration(days: 1)),
    ),
    Task(
      title: "Entrgar prueba",
      note: "Ultimo plazo para la prueba",
      due: DateTime.now().add(const Duration(days: 1)),
    ),
  ];

  String _query = "";

  TaskFilter _filter = TaskFilter.all;

  List<Task> get task => List.unmodifiable(_tasks); //accesador

  String get query => _query;

  TaskFilter get filter => _filter;

  // Filtra por palabra
  List<Task> get filtered {
    final q = _query
        .trim()
        .toLowerCase(); // sacar espacios(trim) llevar minusculas

    return _tasks.where((t) {
      final byFilter = switch (_filter) {
        TaskFilter.all => true,
        TaskFilter.pending => !t.done,
        TaskFilter.done => t.done,
      };
      final byQuery =
          q.isEmpty ||
          t.title.toLowerCase().contains(q) ||
          (t.note?.toLowerCase().contains(q) ?? false);
      return byFilter && byQuery;
    }).toList();
  }

  // cada vez que se haga un cambio se llama esta función
  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }

  void setFilter(TaskFilter filter) {
    _filter = filter;
    notifyListeners();
  }

  void toogle(Task task, bool done) {
    task.done = done;
    notifyListeners();
  }

  void add(String title, {String? note, DateTime? due}) {
    _tasks.insert(0, Task(title: title, note: note, due: due));
    notifyListeners();
  }

  void remove(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
