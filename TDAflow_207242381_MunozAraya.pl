% Nombre: Alvaro Muñoz Araya
% Rut: 20.724.238-1


:-module(tdaflow_207242381_MunozAraya, [flow/4]).

:-use_module(tdaoption_207242381_MunozAraya).

% TDA flow
% Concepto muy basico, falta separar el tda en tdas propios ademas de verificar las opciones repetidas

% _______________________CONSTRUCTOR_______________________
flow(Id,Namemsg,Option,Flow) :-
    number(Id),
    string(Namemsg),
        
    Flow = [Id,Namemsg,Option].

%_______________________MODIFICADOR_______________________
% flowAddOption(Flow, Option, NuevoFlow):-
    % getIdFlow(Flow, Id),
    %
    %
    %
    %
    % flow(Id,Namemsg,Option,NuevoFlow).




isFlow([Id, Namemsg, Option]):-
    flow(Id, Namemsg, Option, [Id, Namemsg, Option]).


getIdFlow([Id,Namemsg,Option], Id):-
    isFlow([Id,Namemsg,Option]).
    