-record(todo, {
    %% 2 keys with default values
    status = reminder,
    who = joe,    
    %%equivalent to key3 = undefined
    text
}).

%to have the record defined at the shell, use rr("records.hrl")
% using the record as template you can define your own
% X1 = #todo{status=urgent, text="Fix errata in book"}.
% #todo{status=urgent, who= joe, text= "Fix errata in book"}
% X2 = X1#todo{status=done}.
% #todo{status=done, who= joe, text= "Fix errata in book"}

%Extracting the fields of a record

% #todo{who=W, text=Txt} = X2.
% W. is joe
% Txt. is "Fix errata in book"

% or X2#todo.text. to extract only the text