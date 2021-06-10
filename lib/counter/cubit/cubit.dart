import 'package:blue_squad_app/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitialState());

  int counter = 1;

  void plus()
  {
    counter++;

    // set state
    emit(CounterAy7agaState());
  }

  void minus()
  {
    counter--;

    // set state
    emit(CounterMinusState('hello'));
  }
}