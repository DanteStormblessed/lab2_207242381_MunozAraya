% Nombre: Alvaro Muñoz Araya
% Rut: 20.724.238-1

:-module(tdaoption_207242381_MunozAraya, [option/6, isOption/1, concatenar/3]).


% _______________________CONSTRUCTOR_______________________

% Descripcion: Crea una opcion en forma de lista
% Metas primarias: option
% Metas secundarias: number, string, number, number
option(Code, Message, ChatbotCodeLink, InitialFlowCL, Keyword, Option) :-
    number(Code),
    string(Message),
    number(ChatbotCodeLink),
    number(InitialFlowCL),
    Option = [Code, Message, ChatbotCodeLink, InitialFlowCL, Keyword].

% _______________________PERTENENCIA_______________________

% Descripcion: Verifica si es option
% Metas primarias: isOption
% Metas secundarias: option
isOption([Code, Message, ChatbotCodeLink , InitialFlowCL, Keyword]):-
    option(Code, Message, ChatbotCodeLink , InitialFlowCL, Keyword, [Code, Message, ChatbotCodeLink , InitialFlowCL, Keyword]).

% _______________________OTROS_______________________

% Descripcion: Concatena un elemento o lista a una lista
% Metas primarias: concatenar
% Metas secundarias: concatenar
concatenar([], List, [List]):-!.
concatenar([Cabeza|Cola1], Lista2, [Cabeza|Resultado]):-
    concatenar(Cola1, Lista2, Resultado).