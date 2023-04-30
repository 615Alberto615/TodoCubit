part of 'etiquetas_cubit.dart';

class EtiquetasState {
  final List<String> values;
  EtiquetasState(this.values);
  EtiquetasState copyWith({List<String>? values}) {
    return EtiquetasState(values ?? this.values);
  }
}
