class Task {
  int _id;
  String _nombre;
  String _etiqueta;
  DateTime _fecha;
  bool _estado;

  Task(this._id, this._nombre, this._etiqueta, this._fecha, this._estado);

  int get id => _id;
  set id(int value) {
    _id = value;
  }

  String get nombre => _nombre;
  set nombre(String value) {
    _nombre = value;
  }

  String get etiqueta => _etiqueta;
  set etiqueta(String value) {
    _etiqueta = value;
  }

  DateTime get fecha => _fecha;
  set fecha(DateTime value) {
    _fecha = value;
  }

  bool get estado => _estado;
  set estado(bool value) {
    _estado = value;
  }

  Task copyWith({
    int? id,
    String? nombre,
    String? etiqueta,
    DateTime? fecha,
    bool? estado,
  }) {
    return Task(
      id ?? this.id,
      nombre ?? this.nombre,
      etiqueta ?? this.etiqueta,
      fecha ?? this.fecha,
      estado ?? this.estado,
    );
  }
}
