import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({
    super.key,
    required this.onChanged, // determina el comportamineto cuando se ingresa texto
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: TextField(
        onChanged: onChanged, // se le entrega el campo que se escribe
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          hintText: "Buscar tareas...",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          filled: true,
        ),
      ),
    );
  }
}
