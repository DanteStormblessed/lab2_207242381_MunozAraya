% Nombre: Alvaro Muñoz Araya
% Rut: 20.724.238-1

:-module(tdachatbot_207242381_MunozAraya, [chatbot/6, chatbotAddFlow/3, isChatbot/1, getChatbotId/2, getChatbotName/2, getChatbotMessage/2, getChatbotStartFlowId/2, getChatboFlows/2]).
:-use_module(tdaflow_207242381_MunozAraya).

% TDA chatbot

chatbot(ChatbotId, Name, WelcomeM, StartFlowId, FlowList, Chatbot):-
    number(ChatbotId),
    string(Name),
    string(WelcomeM),
    number(StartFlowId),
    Chatbot = [ChatbotId, Name, WelcomeM, StartFlowId, FlowList].


chatbotAddFlow(Chatbot, Flow, NewChatbot):-
    getChatbotId(Chatbot, ChatbotId),
    getChatbotName(Chatbot, Name),
    getChatbotMessage(Chatbot, WelcomeM),
    getChatbotStartFlowId(Chatbot, StartFlowId),
    getChatboFlows(Chatbot, FlowList),
    concatenar(FlowList, Flow, NewFlowList),
    chatbot(ChatbotId, Name, WelcomeM, StartFlowId, NewFlowList, NewChatbot).


isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]):-
    chatbot(ChatbotId, Name, WelcomeM, StartFlowId, FlowList, [ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).

getChatbotId([ChatbotId, Name, WelcomeM, StartFlowId, FlowList], ChatbotId):-
    isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).

getChatbotName([ChatbotId, Name, WelcomeM, StartFlowId, FlowList], Name):-
    isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).

getChatbotMessage([ChatbotId, Name, WelcomeM, StartFlowId, FlowList], WelcomeM):-
    isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).

getChatbotStartFlowId([ChatbotId, Name, WelcomeM, StartFlowId, FlowList], StartFlowId):-
    isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).

getChatboFlows([ChatbotId, Name, WelcomeM, StartFlowId, FlowList], FlowList):-
    isChatbot([ChatbotId, Name, WelcomeM, StartFlowId, FlowList]).
