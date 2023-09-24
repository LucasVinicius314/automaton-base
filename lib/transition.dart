import 'package:automaton_base/state.dart';

class Transition {
  const Transition({
    required this.value,
    required this.from,
    required this.to,
  });

  final String value;
  final State from;
  final State to;
}
