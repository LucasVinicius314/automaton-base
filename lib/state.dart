import 'package:automaton_base/transition.dart';

class State {
  const State({
    required this.id,
    required this.isStartingState,
    required this.isAcceptingState,
    required this.transitions,
  });

  final String id;
  final bool isStartingState;
  final bool isAcceptingState;
  final Map<String, Transition> transitions;
}
