import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  
Stream<String> getloadingMessages(){
  final messages = <String>[
    'cargando peliculas',
    'cargando populares',
    'cargando mejor valoradas',
    'prepara las palomitas',
    'jajajaja',
    'vamooooo!',
    'ya casi....',

  ];
  return Stream.periodic(
    const Duration(seconds: 2),
    (step){
      return messages[step];
    }

    ).take(messages.length);
}
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Text('Espere por favor'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream:getloadingMessages(),
            builder: (context, snapshot){
              if(!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data!);
          })
        ],
      ),
    );
  }
}
