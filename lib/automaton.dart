import 'dart:collection';

import 'package:automaton_base/state.dart';
import 'package:automaton_base/transition.dart';

class Automaton {
  const Automaton({
    required this.states,
    required this.symbols,
    required this.startingState,
    required this.acceptingStates,
  });

  final Set<State> states;
  final Set<String> symbols;

  final State startingState;
  final Set<State> acceptingStates;

  bool get isDeterministic {
    for (var state in states) {
      final foundTransitionValues = <String>{};

      for (var transitionKey in state.transitions.keys) {
        if (foundTransitionValues.contains(transitionKey)) {
          return false;
        }

        foundTransitionValues.add(transitionKey);
      }
    }

    return true;
  }

  void addTransition({
    required Transition transition,
  }) {
    transition.from.transitions[transition.value] = transition;
  }

  Automaton asDeterministic() {
    if (isDeterministic) {
      return this;
    }

    final statesToProcess = Queue<State>();

    statesToProcess.addAll(states);

    while (true) {
      if (statesToProcess.isEmpty) {
        break;
      }

      final next = statesToProcess.removeFirst();

      for (var symbol in symbols) {
        final foundTransition = next.transitions[symbol];

        if (foundTransition != null) {
          // TODO: fix, transition map
        }
      }
    }

    // TODO: fix
    return this;
  }
}
