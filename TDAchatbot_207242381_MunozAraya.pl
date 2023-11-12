% Nombre: Alvaro Muñoz Araya
% Rut: 20.724.238-1

:-module(tdachatbot_207242381_MunozAraya, [chatbot/6, chatbotAddFlow/3, isChatbot/1, getChatbotId/2, getChatbotName/2, getChatbotMessage/2, getChatbotStartFlowId/2, getChatbotFlows/2]).
:-use_module(tdaflow_207242381_MunozAraya).

% TDA chatbot

% _______________________CONSTRUCTOR_______________________
% Descripcion: Crea un chatbot en formato de lista
% Metas primarias: chatbot
% Metas secundarias: number, string, string, number
chatbot(ChatbotId, Name, WelcomeM, StartFlowId, FlowList, Chatbot):-
    number(ChatbotId),
    string(Name),
    string(WelcomeM),
    number(StartFlowId),
    Chatbot = [ChatbotId, Name, WelcomeM, StartFlowId, FlowList].

% _______________________MODIFICADOR_______________________

% Descripcion: Añade un flow al chatbot
% Metas primarias: chatbotAddFlow
% Metas secundarias: getChatbotId, getChatbotName, getChatbotMessage, getChatbotStartFlowId, getChatbotFlows, concatenar
chatbotAddFlow(Chatbot, Flow, NewChatbot):-
    getChatbotId(Chatbot, ChatbotId),
    getChatbotName(Chatbot, Name),
    getChatbotMessage(Chatbot, WelcomeM),
    getChatbotStartFlowId(Chatbot, StartFlowId),
    getChatbotFlows(Chatbot, FlowList),
    concatenar(FlowList, Flow, NewFlowList),
    chatbot(ChatbotId, Name, WelcomeM, StartFlowId, NewFlowList, NewChatbot).

% _______________________PERTENENCIA_______________________

% Descripcion: Verifica si es un chatbot
% Metas primarias: isChatbot
% Metas secundarias: chatbot
isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]):-
    chatbot(ChatbotId, Name, WelcomeM, StartFlowId, FlowList, [ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).

% _______________________SELECTOR_______________________

% Descripcion: Obtiene el Id de un chatbot
% Metas primarias: getChatbotId
% Metas secundarias: isChatbot
getChatbotId([ChatbotId, Name, WelcomeM, StartFlowId, FlowList], ChatbotId):-
    isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).

% Descripcion: Obtiene el nombre de un chatbot
% Metas primarias: getChatbotName
% Metas secundarias: isChatbot
getChatbotName([ChatbotId, Name, WelcomeM, StartFlowId, FlowList], Name):-
    isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).

% Descripcion: Obtiene el mensaje de un chatbot
% Metas primarias: getChatbotMessage
% Metas secundarias: isChatbot
getChatbotMessage([ChatbotId, Name, WelcomeM, StartFlowId, FlowList], WelcomeM):-
    isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).

% Descripcion: Obtiene el Start Flow Id de un chatbot
% Metas primarias: getChatbotStartFlowId
% Metas secundarias: isChatbot
getChatbotStartFlowId([ChatbotId, Name, WelcomeM, StartFlowId, FlowList], StartFlowId):-
    isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).

% Descripcion: Obtiene los flows de un chatbot
% Metas primarias: getChatbotFlows
% Metas secundarias: isChatbot
getChatbotFlows([ChatbotId, Name, WelcomeM, StartFlowId, FlowList], FlowList):-
    isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).
