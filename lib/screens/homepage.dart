import 'package:bloc_counter/logic/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

 int counterValue = 0;

  @override
  Widget build(BuildContext context) {

        return BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Scaffold(
                  appBar: AppBar(
                    title: const Text("bloc counter"),
                    centerTitle: true,
                  ),
                  body:   Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.counterValue.toString()
                          ,style: const TextStyle(fontSize: 280),)
                      ],
                    ),
                  ),
            
                  floatingActionButton: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: (){
                          context.read<CounterBloc>().add(IncrementEvent());
                        },
                        child: const Icon(Icons.add),),
            
                      const SizedBox(width: 20,),
            
                      FloatingActionButton(
                        onPressed: (){
                          context.read<CounterBloc>().add(DecrementEvent());
                        },
                        child: const Icon(Icons.remove),),
                    ],
                  ),
                );
          },
        );
  }
}