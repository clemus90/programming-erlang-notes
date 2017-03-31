-module(geometry).
-export([area/1]).

%first line is the module declaration, same name as the file without the extension
%second line is the export declaration following the Name/N notation where N is the arity of the function
% the number of parameters. exported parameters are analogous to the public methods, the others are private

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side.
%area is a function of two clauses clauses are separated by ; and functions are finished with.
%a clause separates head to body with -> the head is defined by the name of the function an a series of patterns inside ()

%try in the repl:
% c(geometry).
% geometry:area({rectangle,10,5}).
% geometry:area({square, 3}).


%Erlang console has directory traversal commands analogous to unix, pwd(), ls(), cd(Dir)