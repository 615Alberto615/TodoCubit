import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'etiquetas_state.dart';

class EtiquetasCubit extends Cubit<List<String>> {
  EtiquetasCubit(List<String> lista) : super(lista.isEmpty ? [''] : lista);

  void addElemeto(String elem) {
    final nuevaLista = [...state, elem];
    emit(nuevaLista);
  }

  void seleccionarValue(String nuevoValue) {
    final nuevaLista = state.toList();
    final valorIndex = nuevaLista.indexOf(nuevoValue);
    if (valorIndex != -1) {
      nuevaLista.removeAt(valorIndex);
      nuevaLista.insert(0, nuevoValue);
    } else {
      nuevaLista.insert(0, nuevoValue);
    }
    emit(nuevaLista);
  }

  void editElemento(int index, String nuevoElem) {
    final listaActual = state.toList();
    listaActual[index] = nuevoElem;
    emit(listaActual);
  }

  void deleteElemento() {
    final nuevaLista = state.toList();
    final valorSelect = nuevaLista[0];
    nuevaLista.remove(valorSelect);
    emit(nuevaLista);
  }
}
