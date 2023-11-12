% Nombre: Alvaro Muñoz Araya
% Rut: 20.724.238-1


:-module(tdaflow_207242381_MunozAraya, [flow/4, flowAddOption/3, flowGetOptions/2, flowGetMensagge/2, isFlow/1, getFlowId/2]).

:-use_module(tdaoption_207242381_MunozAraya).

% TDA flow
% Concepto muy basico, falta separar el tda en tdas propios ademas de verificar las opciones repetidas

% _______________________CONSTRUCTOR_______________________
flow(Id,Namemsg,Option,Flow) :-
    number(Id),
    string(Namemsg),
        
    Flow = [Id,Namemsg,Option].

%_______________________MODIFICADOR_______________________
flowAddOption(Flow, Option, NewFlow):-
    getFlowId(Flow, Id),
    flowGetMensagge(Flow, Namemsg),
    flowGetOptions(Flow, Options),
    concatenar(Options, Option, NewOptionList),
    flow(Id,Namemsg,NewOptionList,NewFlow).


flowGetOptions([Id,Namemsg,Option],Option):-
    isFlow([Id,Namemsg,Option]).

flowGetMensagge([Id,Namemsg,Option],Namemsg):-
    isFlow([Id,Namemsg,Option]).

isFlow([Id, Namemsg, Option]):-
    flow(Id, Namemsg, Option, [Id, Namemsg, Option]).


getFlowId([Id,Namemsg,Option], Id):-
    isFlow([Id,Namemsg,Option]).



