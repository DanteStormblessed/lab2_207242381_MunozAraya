% Nombre: Alvaro Muñoz Araya
% Rut: 20.724.238-1

:-module(tdasystem_207242381_MunozAraya, [system/4, systemAddChatbot/3, systemAddUser/3, systemLogin/3, isSystem/1, isUser/1, getSystemName/2, getSystemInitialChatbotCL/2, getSystemChatbolList/2, getSystemUser/2, getSystemChatHistory/2, getSystemUsersList/2]).
:-use_module(tdachatbot_207242381_MunozAraya).

% TDA system

system(NameSys, InitialChatbotCL, ChatbotList, System):-
    string(NameSys),
    number(InitialChatbotCL),

    System = [NameSys, InitialChatbotCL, ChatbotList, [], [], []].




systemAddChatbot(System, Chatbot, NewSystem):-
    getSystemName(System, NameSys),
    getSystemInitialChatbotCL(System, InitialChatbotCL),
    getSystemChatbolList(System, ChatbotList),
    getSystemUser(System, User),
    getSystemChatHistory(System, ChatHistory),
    getSystemUsersList(System, UsersList),
    concatenar(ChatbotList, Chatbot, NewChatbotList),
    NewSystem = [NameSys, InitialChatbotCL, NewChatbotList, User, ChatHistory, UsersList].

systemAddUser(System, NewUser, NewSystem):-
    getSystemName(System, NameSys),
    getSystemInitialChatbotCL(System, InitialChatbotCL),
    getSystemChatbolList(System, ChatbotList),
    getSystemUser(System, User),
    getSystemChatHistory(System, ChatHistory),
    getSystemUsersList(System, UsersList),
    concatenar(UsersList, NewUser, NewUsersList),
    NewSystem = [NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, NewUsersList].

systemLogin(System, NewUser, NewSystem):-
    getSystemName(System, NameSys),
    getSystemInitialChatbotCL(System, InitialChatbotCL),
    getSystemChatbolList(System, ChatbotList),
    getSystemUser(System, User),
    getSystemChatHistory(System, ChatHistory),
    getSystemUsersList(System, UsersList),
    concatenar(User,NewUser,LogedUser),
    isSystem([NameSys, InitialChatbotCL, ChatbotList, LogedUser, ChatHistory, UsersList]),
    NewSystem = [NameSys, InitialChatbotCL, ChatbotList, LogedUser, ChatHistory, UsersList].


isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]):-
    system(NameSys, InitialChatbotCL, ChatbotList, [NameSys, InitialChatbotCL, ChatbotList,_,_,_]),
    isUser(User),
    is_list(ChatHistory),
    is_list(UsersList).

isUser(User):-
    (length(User,0);length(User,1)).

getSystemName([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], NameSys):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).

getSystemInitialChatbotCL([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], InitialChatbotCL):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).

getSystemChatbolList([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], ChatbotList):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).

getSystemUser([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], User):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).

getSystemChatHistory([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], ChatHistory):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).

getSystemUsersList([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], UsersList):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).


