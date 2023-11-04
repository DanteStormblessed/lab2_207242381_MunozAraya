/*
integer(Code),atom(Message),integer(ChatbotCodeLink),integer(InitialFlowCL), is_list(Keyword),
*/
%TDA Option
option(Code, Message, ChatbotCodeLink, InitialFlowCL, Keyword, Option) :-
    Option = [Code, Message, ChatbotCodeLink, InitialFlowCL, Keyword].



%TDA Flow
flow(Id, Name-msg, Option, Flow) :-
    Flow = [Id, Name-msg, Option].


