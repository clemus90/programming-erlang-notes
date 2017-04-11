-module(summary).
-export([test/0]).

test() ->
    %apply
    % A BIF to apply a function with the given arguments
    % apply(Mod, Func, [Arg1, Arg2, Arg3 ..., ArgN])
    % same as Mod:Func(Arg1, Arg2, Arg3, ..., ArgN)
    apply(erlang, atom_to_list, [hello]).

    %{Mod, P1, P2, ...., Pn}:Func(A1, A2, ..., An)
    % same as Mod:Func(A1,A2,...,An, {Mod, P1, P2, ..., Pn})

    %Arithmetic Expressions
    %same as other languages except for
    
    % bnot X : Bitwise not of X
    % X div Y : Integer division of X and Y
    % X rem Y : Modulus of X and Y
    % X band Y : bitwise and of X and Y
    % X bor Y : bitwise or of X and Y
    % X bsl N : bitshift left n units to X
    % X bsr N : bitshift right n units to X

    %arity
    % number of parameters of a function
    % a pair of functions with the same name and different parameters
    % a completely unrelated functions (something like overloading in Java)

    %attributes
    % atoms that stars with dash like -module or -export
    % you can also define your own properties
    % like -author(christian, lemus).
    % or
    % -purpose("Example of attributes").
    % to check the attributes from a module use mod:module_info() where mod
    % is the name of the module you want the info from
    % the user defined attributes are located on the attributes section
    % you can alternatively use beam_lib:chuncks("mod.beam", [attributes]), in case
    % you don't want to load the module to get its information

    %Block Expressions
    % can be used when erlang requires a single expression, but you need many to
    % get there
    % the structure is as follows
    % begin
    %   Expr1,
    %   Expr2,
    % end
    % the value of the whole block is the last line of it

    %Boolean
    % the atoms true and false represents the boolean values internally,
    % it is not required to work with true or false to return a binary response,
    % but it is recommended, in order to use functions that are part of the standard
    % such as filter, or partition.

    %Boolean Expressions
    % true and false atoms are also useful for operations like 'not' 'and' 'or' and 'xor'
    % expressions using this operations should evaluate to one of the two atoms

    %Character Set
    % UTF-8 is used.

    % comments are represented with %, there is no block comment, if you see %% is a convention from emacs.

    % Dynamic Code Loading
    % when running you'll always point to the last compiled version of a Module, even if you
    % recompile a module, while other processes are using it, every reference will point out to
    % the last compilation

    % that is true for the modules being referenced from a module.
    % if the module in question is running while the recompilations happens, erlang keep just 1 old version of the
    % module running, any process that start with that version will continue loading, along with the process created
    % with the new version, but if we change one more time the module and spawn some processes of it, the process that
    % were created with the second to last version will be killed.

    %Erlang Preprocessor
    % erlang runs a preprocessor even before any module compilation, this preprocessing takes care of expanding macros,
    % and running includes necessary before compilation.
    % to check the output of the preprocessor use:
    % erlc -P some_module.erl

    %Escape Sequences
    % as other languages, inside a string, backslash is the scape character

    %Expressions and Expression Sequences
    % anything that return a value is considered a expression (so registers and attributes are not considered expressions)
    % expression separated by , forms a expression sequence

    %Function References
    % where needed to use functions in a module as funcs, you can use the fun expression as follows:
    % fun LocalFunc/Arity
    % in this way it is possible to pass functions defined in a module as funs to other functions
    %lists:map(fun square/1, L).

    %Include files
    % have hrl extension, to include use -include(Filename): Filename is relative or absolute
    % -include_lib is usted to include library files

    % List operations ++ and --
    % ++ appends to a list
    % -- deletes the elements in the right side operand, from the left side operand

    %Macros
    % replacements supposed to happen after precompilation are defined as 
    % -define(Constan, Replacement).
    % or
    % -define(Func(Var1, Var2,..., Var), Replacement).
    % and used with ?
    % for example
    % -define(macro1(X,Y), {a, X, Y}).
    % ...
    % foo(A) ->
    %   ?macro1(A+10, b)
    % expands to
    % foo(A) ->
    %   {a, A+10, b}
    % some predefined macros
    % ?FILE
    % ?MODULE
    % ?LINE
    % control flow of macros
    % -ifdef(Macro) = enters if Macro is defined
    % -ifndef(Macro) = enters if Macro is undefined
    % -undef(Macro) = undefines the macro
    % -else = same as if, but after ifdef and ifndef
    % -endif = finalizes the ifdef and ifndef clauses
    % to set flags in compilation time use a second parameter in th c function which contains a tuple with the macros to define
    % c(m1, {d, debug_flag})

    %Match Operator in Patterns
    % = can be used in any point during a match for example
    % func1([{tag1, A, B}=Z|T])
    % A and B will have the deconstructed values, and the whole tuple will get stored in Z
    %func1([tag, {one, A}=Z1, B]=Z2|T]) ->
    % A and B will have the values as expected, Z1 will have the inner tuple, and Z2 will have the inner list

    %Numbers
    % integer or float
    % for integers, Base# changes base, $[char] gives the integer representation of the char

    %Process Dictionary
    % each process has its own private data store called the process dictionary
    % to add a value put(Key, Value) and the method returns the previous value assosiated with the key, or undefined if None
    % value is associated
    % get(Key) to return the Value associated with the key
    % get() will bring an array with every key and value as a tuple
    % get_keys() gets the array of keys
    % erase_key(Key) deletes the Value associated with the Key and return it, or undefined if None
    % erase() deletes the whole dictionary

    %References
    %globally created with erlang:make_ref()

    %Short Circuit operands
    %`orelse` and `andalso`

    %Term Comparison
    % number < atom < reference < fun < port < pid < tuple (and record) < map < list < binary
    % for numeric comparisons, integers are converted to floats if needed except for the operands
    % =:= and =/= which means identical and not identical respectively
    
    %Underscore variables
    % prepending a variable with an underscore will stop the compiler from throwing a warning where
    % a variable is never used.