import 'package:automaton_base/automaton.dart';
import 'package:automaton_base/state.dart';
import 'package:automaton_base/transition.dart';
import 'package:test/test.dart';

void main() {
  test('determinism 0', () {
    final a = State(
      id: 'A',
      isStartingState: true,
      isAcceptingState: false,
      transitions: {},
    );

    final automaton = Automaton(
      states: {},
      symbols: {'0', '1'},
      startingState: a,
      acceptingStates: {},
    );

    expect(automaton.isDeterministic, true);
  });

  test('determinism 1', () {
    final a = State(
      id: 'A',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final automaton = Automaton(
      states: {a},
      symbols: {'0', '1'},
      startingState: a,
      acceptingStates: {},
    );

    expect(automaton.isDeterministic, true);
  });

  test('determinism 2', () {
    final a = State(
      id: 'A',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final b = State(
      id: 'B',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final automaton = Automaton(
      states: {a, b},
      symbols: {'0', '1'},
      startingState: a,
      acceptingStates: {b},
    );

    expect(automaton.isDeterministic, true);
  });

  test('determinism 3', () {
    final a = State(
      id: 'A',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final b = State(
      id: 'B',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final automaton = Automaton(
      states: {a, b},
      symbols: {'0', '1'},
      startingState: a,
      acceptingStates: {b},
    );

    automaton.addTransition(transition: Transition(value: '0', from: a, to: b));

    expect(automaton.isDeterministic, true);
  });

  test('determinism 4', () {
    final a = State(
      id: 'A',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final b = State(
      id: 'B',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final c = State(
      id: 'C',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final automaton = Automaton(
      states: {a, b, c},
      symbols: {'0', '1'},
      startingState: a,
      acceptingStates: {b, c},
    );

    automaton.addTransition(transition: Transition(value: '0', from: a, to: b));
    automaton.addTransition(transition: Transition(value: '1', from: a, to: b));
    automaton.addTransition(transition: Transition(value: '1', from: b, to: c));

    expect(automaton.isDeterministic, true);
  });

  test('determinism 5', () {
    final a = State(
      id: 'A',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final b = State(
      id: 'B',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final c = State(
      id: 'C',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final automaton = Automaton(
      states: {a, b, c},
      symbols: {'0', '1'},
      startingState: a,
      acceptingStates: {b, c},
    );

    automaton.addTransition(transition: Transition(value: '0', from: a, to: b));
    automaton.addTransition(transition: Transition(value: '0', from: a, to: c));

    expect(automaton.isDeterministic, false);
  });

  test('determinism 6', () {
    final a = State(
      id: 'A',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final b = State(
      id: 'B',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final automaton = Automaton(
      states: {a, b},
      symbols: {'0', '1'},
      startingState: a,
      acceptingStates: {b},
    );

    automaton.addTransition(transition: Transition(value: '0', from: a, to: b));
    automaton.addTransition(transition: Transition(value: '0', from: b, to: a));

    expect(automaton.isDeterministic, true);
  });

  test('determinism 7', () {
    final a = State(
      id: 'A',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final b = State(
      id: 'B',
      isStartingState: false,
      isAcceptingState: false,
      transitions: {},
    );

    final automaton = Automaton(
      states: {a, b},
      symbols: {'0', '1'},
      startingState: a,
      acceptingStates: {a, b},
    );

    automaton.addTransition(transition: Transition(value: '0', from: a, to: b));
    automaton.addTransition(transition: Transition(value: '1', from: a, to: b));
    automaton.addTransition(transition: Transition(value: '0', from: b, to: a));
    automaton.addTransition(transition: Transition(value: '1', from: b, to: a));

    expect(automaton.isDeterministic, true);
  });
}
