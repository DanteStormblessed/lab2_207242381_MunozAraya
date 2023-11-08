% Nombre: Alvaro Muñoz Araya
% Rut: 20.724.238-1
:-module(tdaoption_207242381_MunozAraya, [option/6]).

% TDA option


option(Code, Message, ChatbotCodeLink, InitialFlowCL, Keyword, Option) :-
    number(Code),
    string(Message),
    number(ChatbotCodeLink),
    number(InitialFlowCL),
    
    Option = [Code, Message, ChatbotCodeLink, InitialFlowCL, Keyword].


