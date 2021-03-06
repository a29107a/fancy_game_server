%%----------------------------------------------------
%% 角色相关远程调用
%%----------------------------------------------------
-module(role_rpc).
-export([
        handle/3
    ]
).
-include("common.hrl").
-include("role.hrl").


%% ----------------------------------------------------
%% 外部接口
%% ----------------------------------------------------

%% 初始化请求角色数据
handle(10000, _, #role{id = {Rid, P, Z}, name = Name, lev = Lev, hp_max = HpMax, hp = Hp}) ->
    Rsp = {Rid, P, Z, Name, Lev, HpMax, Hp},
    {reply, Rsp};

%% 容错匹配
handle(_Cmd, _Data, _Role) ->
    ?DEBUG("模块[~w]收到无效的RPC调用: ~w ~w", [?MODULE, _Cmd, _Data]),
    {error, unknow_command}.


%% ----------------------------------------------------
%% 私有函数
%% ----------------------------------------------------
