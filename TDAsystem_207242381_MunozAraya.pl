% Nombre: Alvaro Muñoz Araya
% Rut: 20.724.238-1

:-module(tdasystem_207242381_MunozAraya, [system/4, systemTalkRec/3 , systemAddChatbot/3, systemAddUser/3, systemLogin/3, systemLogout/2, isSystem/1, isUser/1, getSystemName/2, getSystemInitialChatbotCL/2, getSystemChatbolList/2, getSystemUser/2, getSystemChatHistory/2, getSystemUsersList/2, search/3, search2/3, id/6, getDate/1, getTail/2, getSecond/2, change/4, member/2]).
:-use_module(tdachatbot_207242381_MunozAraya).

% TDA system

% _______________________CONSTRUCTOR_______________________

% Descripcion: crea un sistema en formato lista
% Metas primarias: system
% Metas secundarias: string, number
system(NameSys, InitialChatbotCL, ChatbotList, System):-
    string(NameSys),
    number(InitialChatbotCL),
    no_repetidos(ChatbotList),
    System = [NameSys, InitialChatbotCL, ChatbotList, [], [], []].

% _______________________MODIFICADOR_______________________
% Descripcion: Añade un chatbot al sistema
% Metas primarias: systemAddChatbot
% Metas secundarias: getSystemName, getSystemInitialChatbotCL, getSystemChatbolList, getSystemUser, getSystemChatHistory, getSystemUsersList, concatenar
systemAddChatbot(System, Chatbot, NewSystem):-
    getSystemName(System, NameSys),
    getSystemInitialChatbotCL(System, InitialChatbotCL),
    getSystemChatbolList(System, ChatbotList),
    getSystemUser(System, User),
    getSystemChatHistory(System, ChatHistory),
    getSystemUsersList(System, UsersList),
    not_member(Chatbot, ChatbotList),
    concatenar(ChatbotList, Chatbot, NewChatbotList),
    NewSystem = [NameSys, InitialChatbotCL, NewChatbotList, User, ChatHistory, UsersList].


% Descripcion: Añade un usuario al sistema
% Metas primarias: systemAddUser
% Metas secundarias: getSystemName, getSystemInitialChatbotCL, getSystemChatbolList, getSystemUser, getSystemChatHistory, getSystemUsersList, concatenar
systemAddUser(System, NewUser, NewSystem):-
    getSystemName(System, NameSys),
    getSystemInitialChatbotCL(System, InitialChatbotCL),
    getSystemChatbolList(System, ChatbotList),
    getSystemUser(System, User),
    getSystemChatHistory(System, ChatHistory),
    getSystemUsersList(System, UsersList),
    concatenar(UsersList, NewUser, NewUsersList),
    NewSystem = [NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, NewUsersList].

% Descripcion: Logea a un usuario en un sistema, es decir lo añade en User
% Metas primarias: systemLogin
% Metas secundarias: getSystemName, getSystemInitialChatbotCL, getSystemChatbolList, getSystemUser, getSystemChatHistory, getSystemUsersList, concatenar, isSystem
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

% Descripcion: Deslogea a un usuario en un sistema, es decir lo quita de User
% Metas primarias: systemLogout
% Metas secundarias: getSystemName, getSystemInitialChatbotCL, getSystemChatbolList, getSystemUser, getSystemChatHistory, getSystemUsersList, length, isSystem
systemLogout(System, NewSystem):-
    getSystemName(System, NameSys),
    getSystemInitialChatbotCL(System, InitialChatbotCL),
    getSystemChatbolList(System, ChatbotList),
    getSystemUser(System, User),
    getSystemChatHistory(System, ChatHistory),
    getSystemUsersList(System, UsersList),
    length(User,1),
    isSystem([NameSys, InitialChatbotCL, ChatbotList, [], ChatHistory, UsersList]),
    NewSystem = [NameSys, InitialChatbotCL, ChatbotList, [], ChatHistory, UsersList].


systemTalkRec(System, Message, NewSystem):-
    getSystemName(System, NameSys),
    getSystemInitialChatbotCL(System, InitialChatbotCL),
    getSystemChatbolList(System, ChatbotList),
    getSystemUser(System, User),
    getSystemChatHistory(System, ChatHistory),
    getSystemUsersList(System, UsersList),
    isUser(User),
    getUserHistory(User, ChatHistory, UserHistory),
    getTail(UserHistory, UserMessages),
    getDate(Date),
    (length(UserMessages, 0),
        getSystemChatbolList(System,[A|_]),
        getChatbotId(A,ChatbotId),
        getChatbotFlows(A,[B|_]),
        getFlowId(B,FlowId),
        NewMessage=[Message,Date,ChatbotId,FlowId],
        append(UserMessages,[NewMessage],MessageFirst),
        NewUserHistory=[User,MessageFirst],
        change(UserHistory,NewUserHistory,ChatHistory,NewChatHistory),
        NewSystem = [NameSys, InitialChatbotCL, ChatbotList, [User], NewChatHistory, UsersList],!
        ;
        getTail(UserMessages,[_,_,ChabotId,FlowIds]),
        id(ChabotId,FlowIds,ChatbotList,Message,ChatbotFinded,FlowFinded),
        NewMessage=[Message,Date,ChatbotFinded,FlowFinded],
        append(UserMessages,[NewMessage],MessageFirst),
        NewUserHistory=[User,MessageFirst],
        change(UserHistory,NewUserHistory,ChatHistory,NewChatHistory),
        NewSystem = [NameSys, InitialChatbotCL, ChatbotList, [User], NewChatHistory, UsersList],!
    ),!.

% _______________________PERTENENCIA_______________________


% Descripcion: Verifica si es un sistema
% Metas primarias: isSystem
% Metas secundarias: system, isUser, is_list, is_list
isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]):-
    system(NameSys, InitialChatbotCL, ChatbotList, [NameSys, InitialChatbotCL, ChatbotList,_,_,_]),
    isUser(User),
    is_list(ChatHistory),
    is_list(UsersList).

% Descripcion: Verifica si es User
% Metas primarias: isUser
% Metas secundarias: length
isUser(User):-
    (length(User,0);length(User,1)).

% _______________________SELECTOR_______________________

% Descripcion: Obtiene el Nombre de un sistema
% Metas primarias: getSystemName
% Metas secundarias: isSystem
getSystemName([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], NameSys):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).

% Descripcion: Obtiene el Initial Chatbot Code Link de un sistema
% Metas primarias: getSystemInitialChatbotCL
% Metas secundarias: isSystem
getSystemInitialChatbotCL([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], InitialChatbotCL):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).

% Descripcion: Obtiene la lista de chatbots de un sistema
% Metas primarias: getSystemChatbolList
% Metas secundarias: isSystem
getSystemChatbolList([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], ChatbotList):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).

% Descripcion: Obtiene el User logeado de un sistema
% Metas primarias: getSystemUser
% Metas secundarias: isSystem
getSystemUser([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], User):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).

% Descripcion: Obtiene el chat history de un sistema
% Metas primarias: getSystemChatHistory
% Metas secundarias: isSystem
getSystemChatHistory([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], ChatHistory):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).

% Descripcion: Obtiene la listad de usuarios creados en un sistema
% Metas primarias: getSystemUsersList
% Metas secundarias: isSystem
getSystemUsersList([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList], UsersList):-
    isSystem([NameSys, InitialChatbotCL, ChatbotList, User, ChatHistory, UsersList]).

% Descripcion: Obtiene el Historial del usuario de un sistema
% Metas primarias: getUserHistory
% Metas secundarias: member
getUserHistory(User, [[User, Historial] | _], [User, Historial]) :-!.
getUserHistory(User, [Otro | Tail], A):- 
    member(User, Otro), getUserHistory(User, Tail, A).
getUserHistory(_, [], []).

% _______________________OTROS_______________________


change(_, _, [], []).
change([Old, L1], [New, L2], [[Old, L1] | Rest], [[New, L2] | NewRest]) :-
    !, change([Old, L1], [New, L2], Rest, NewRest).
change(Old, New, [[A, B] | Rest], [[A, B] | NewRest]) :-
    dif(A, Old),
    change(Old, New, Rest, NewRest).

getSecond([_,Second], Second).

getTail([A], A).
getTail([_|B], A):- 
    getTail(B, A).

getDate(Fecha) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, 'local'),
    date_time_value(year, DateTime, Year),
    date_time_value(month, DateTime, Month),
    date_time_value(day, DateTime, Day),
    date_time_value(hour, DateTime, Hour),
    date_time_value(minute, DateTime, Minute),
    date_time_value(second, DateTime, Second),
    atom_concat(Year, '', YearStr),
    atom_concat(Month, '', MonthStr), 
    atom_concat(Day, '', DayStr), 
    atom_concat(Hour, '', HourStr),
    atom_concat(Minute, '', MinuteStr),
    atom_concat(Second, '', SecondStr),
    atomic_list_concat([YearStr, MonthStr, DayStr, HourStr, MinuteStr, SecondStr], '', Fecha).

id(ChatbotId,FlowId,Chatbots,Message,ChatbotFinded,FlowFinded):-
    search(Chatbots,ChatbotId, [_,_,_,_,Flows]),
    search(Flows,FlowId,[_,_,Options]),
    search2(Options,Message,[_,_,ChatbotFinded,FlowFinded,_]).

search([], _, []).
search([[A | B] | C], Id, IdFinded) :-
    (
        A = Id, 
        IdFinded = [A|B]
        ;
        search(C, Id, IdFinded)
    ),!.

search2([], _, []).
search2([[Id,Tittle,Number,Code,Words] | Rest], Message, IdFinded) :-
    (
        (
            number(Message),
            Message is Id,
            IdFinded = [Id,Tittle,Number,Code,Words]
            ;
            string(Message),
            member(Message,Words),
            IdFinded = [Id,Tittle,Number,Code,Words]
        )
    ;    
    search2(Rest, Message, IdFinded)
    ),!.

member(A,[A|_]).
member(A,[_|Rest]):-
    member(A,Rest).