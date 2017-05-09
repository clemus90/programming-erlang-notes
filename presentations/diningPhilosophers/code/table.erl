-module(table).
-export([simulate/0]).

simulate() ->
    C1 = chopstick_provider:start('table@EN911036.endava.net', "C1"),
    C2 = chopstick_provider:start('table@EN911036.endava.net', "C2"),
    C3 = chopstick_provider:start('table@EN911036.endava.net', "C3"),
    C4 = chopstick_provider:start('table@EN911036.endava.net', "C4"),
    C5 = chopstick_provider:start('table@EN911036.endava.net', "C5"),

    _P1 = philosopher:start('aristotle@EN911036.endava.net', 'Aristotle', C1, C2),
    _P2 = philosopher:start('plato@EN911036.endava.net', 'Plato', C2, C3),
    _P3 = philosopher:start('descartes@EN911036.endava.net', 'Descartes', C3, C4),
    _P4 = philosopher:start('confucius@EN911036.endava.net', 'Confucius', C4, C5),
    _P5 = philosopher:start('locke@EN911036.endava.net', 'Locke', C5, C1).

