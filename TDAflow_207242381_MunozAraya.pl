% Nombre: Alvaro Muñoz Araya
% Rut: 20.724.238-1


:-module(tdaflow_207242381_MunozAraya, [flow/4, flowAddOption/3, flowGetOptions/2, flowGetMensagge/2, isFlow/1, getFlowId/2, no_repetidos/1, not_member/2]).
:-use_module(tdaoption_207242381_MunozAraya).

% _______________________CONSTRUCTOR_______________________

% Descripcion: Crea un flow en formato de lista
% Metas primarias: flows
% Metas secundarias: number, string
flow(Id,Namemsg,Option,Flow):-
    number(Id),
    string(Namemsg),    
    no_repetidos(Option),     
    Flow = [Id,Namemsg,Option].

% _______________________MODIFICADOR_______________________

% Descripcion: Añade una opcion al flow
% Metas primarias: flowAddOption
% Metas secundarias: getFlowId, flowGetMensagge, flowGetOptions, concatenar
flowAddOption(Flow, Option, NewFlow):-
    getFlowId(Flow, Id),
    flowGetMensagge(Flow, Namemsg),
    flowGetOptions(Flow, Options),
    not_member(Option, Options),
    concatenar(Options, Option, NewOptionList),
    flow(Id,Namemsg,NewOptionList,NewFlow).

% _______________________SELECTOR_______________________

% Descripcion: Obtiene las opciones de un flow
% Metas primarias: flowGetOptions
% Metas secundarias: isFlow
flowGetOptions([Id,Namemsg,Option],Option):-
    isFlow([Id,Namemsg,Option]).

% Descripcion: Obtiene el mensaje de un flow
% Metas primarias: flowGetMensagge
% Metas secundarias: isFlow
flowGetMensagge([Id,Namemsg,Option],Namemsg):-
    isFlow([Id,Namemsg,Option]).

% Descripcion: Obtiene el Id de un flow
% Metas primarias: getFlowId
% Metas secundarias: isFlow
getFlowId([Id,Namemsg,Option], Id):-
    isFlow([Id,Namemsg,Option]).

% _______________________PERTENENCIA_______________________

% Descripcion: Verifica si es un flow
% Metas primarias: isFlow
% Metas secundarias: flow
isFlow([Id, Namemsg, Option]):-
    flow(Id, Namemsg, Option, [Id, Namemsg, Option]).

% _______________________OTROS_______________________

% Descripcion: Devuelve false si hay elementos repetidos en una lista
% Metas primarias: no_repetidos
% Metas secundarias: member, no_repetidos
no_repetidos([]).
no_repetidos([Head | Tail]):-
    \+ member(Head, Tail),
    no_repetidos(Tail).  

% Descripcion: Devuelve false si un elemento esta dentro de una lista
% Metas primarias: not_member
% Metas secundarias: member
not_member(Element, List):-
    \+ member(Element, List).






