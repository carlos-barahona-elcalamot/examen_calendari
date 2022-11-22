import 'package:examen_calendari/modelo.dart';

class EsdevenimentsController {
  String? _titol;
  DateTime? _dataInici;

  DateTime? get dataInici => _dataInici;

  set dataInici(DateTime? value) {
    _dataInici = value;
  }

  DateTime? _dataFi;
  String? _descripcio;

  String? get titol => _titol;

  set titol(String? value) {
    _titol = value;
  }

  List<Esdeveniment> getEsdeveniments({DateTime? elDia}) {
    if (elDia != null) {
      elDia = DateTime(elDia.year, elDia.month, elDia.day);
    }

    return elDia == null
        ? Model().esdeveniments
        : Model()
            .esdeveniments
            .where((element) =>
                (element.horaInici.isBefore(elDia!) &&
                    element.horaFinal.isAfter(elDia)) ||
                (DateTime(element.horaInici.year, element.horaInici.month,
                            element.horaInici.day)
                        .isAtSameMomentAs(elDia) ||
                    DateTime(element.horaFinal.year, element.horaFinal.month,
                            element.horaFinal.day)
                        .isAtSameMomentAs(elDia)))
            .toList();
  }

  DateTime? get dataFi => _dataFi;

  set dataFi(DateTime? value) {
    _dataFi = value;
  }

  String? get descripcio => _descripcio;

  set descripcio(String? value) {
    _descripcio = value;
  }

  void save() {
    Model().esdeveniments.add(Esdeveniment(
        horaInici: dataInici!,
        horaFinal: dataFi!,
        titol: titol!,
        descripcio: descripcio));
  }
}
