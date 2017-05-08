# Distributed Programming
## Two models for distribution
- Distributed Erlang
    - programs written to run on Erlang nodes, a process can live on any node, everything explored until here, works the same way as the single node examples.
    - A factor of trust is considered, since any Erlang node can call other node functionality, often distributed in a controlled environment, LAN behind a firewall.
- Socked-based distribution
    - allows the execution on insecure environments
## Writing a Distributed Program
- Order of tackling a program
    1. Write in regular nondistributed Erlang
    2. Test on 2 erlang nodes on the same machine
    3. Test on 2 erlang nodes on 2 different machines
## Building the Name Server
- A name server, have names associated with values
- the name server is defined in the module _kvs_
- to start a module with a name us the -sname flag, `erl -sname gandalf`
- to call functions defined in a separate erlang node we us the _rpc_ module on erlang
    ```
    erl -sname bilbo
    rpc:call(gandalf@localhost, kvs, store, [weather, fine]).
        true
    rpc:call(gandalf@localhost, kvs, lookup, [weather]).
        {ok, fine}
    ```
    - the signature of rpc is the following: `rpc:call(Node, Mod, Func, [Arg1, Arg2, ..., ArgN])`, the function to be called is `Mod:Func(Arg1, Arg2,..., ArgN)`
- running on erlang nodes located on different machines is similar but with some subtelties
    - the flag `-name` is used instead of `-sname`, sname can be used in different machines if they are on the same subnet, also sname is the only option if no DNS is available
    - the machines communicating with each other needs the same cookie, using the `-setcookie` parameter like this `erl -name bilbo -setcookie abc`, the cookies are a protection mechanism, the cookie is not needed on the same machine since both erlang nodes had access to the file `$HOME/.erlang.cookie`
    - make sure the names are resolvable by the DNS, or add entries to the host file
    - same version of the code needs to be located in the multiple nodes, there are multiple ways to achieve this
        - using share locations, using shared folders, of NFS for example
        - configuring the code server, using _erl\_prim\_loader_
        - using the `nl(Mod)` from the shell to copy the code to all the connected nodes
            - a node is said to be connected to another, the first time it tries to access each other, the easiest way of achieving this is using `net_adm:ping(Node)`
- When running on different domains you need to make sure the port `4369` is open for TCP and UDP traffic, used by _epmd_
    - also you need a port pool for distributing Erlang, using a Min port and a Max port like this, `erl -name ... -setcookie ... - kernel inet_dist_listen_min Min inet_dist_listen_max Max`
## Libraries and BIFS for Distributed Programming
- modules for distribution
    - rpc
    - global, has functions for registration, locks, and network maintenance
    - commonly used
        - `rpc:call(Node, Mod, Function, Args)`
        - `spawn(Node, Fun)`
        - `spawn(Node, Mod, Func, ArgList)`
        - `spawn_link(Node, Fun)`
        - `spawn_link(Node, Mod, Func, ArgList)`
        - `disconnect_node(Node)`
        - `monitor_node(Node, Flag)` if Flag, monitoring is turned on, otherwise is turned off for Node from the current Process
        - `node()` returns the name of the current node
        - `is_alive()`
        - `{RegName, Node} ! Msg`, send __Msg__ to the named Process __RegName__ on node __Node__
- using spawn on different nodes, based on the _dis\_demo_ module
    - the same module needs to be compiled on the machines that are going to be communicating
    ```
    Pid = dist_demo:start('gandalf@doris.myerl.example.com`).
    dist_demo:rpc(Pid, erlang, node, []).
    ```
## The Cookie Protection System
to be able to communicate erlang nodes, they need to share the same cookie, either by setting it on startup using the setcookie flag, setting it on runtime using `erlang:set_cookie(node(), Cookie)`, or defining the same cookie for the _.erlang.cookie_ file
- over systems distributed over the internet, the cookie system is not sufficient, the communication among nodes needs to be secure first
## Socket-Based Distribution
- distributed erlang requires a great ammount of trust between machines, since you could spawn any process on a remote machine, even destroy the whole system by that amount of freedom.
- lib_chan
    - a module that controls specifically which processes can be spawned remotely
        - `start_server()` starts a server on the localhost, the behavior is defined in `$HOME/.erlang_config/lib_chan.conf`, to define a different configuration use `start_server(Conf)` where Conf contains a list of tuples of the following form: `{port, NNNN}`, this starts listening on port NNNN
        - `{server, S, password, P, mfa, SomeMod, SomeFunc, SomeArgsS}`
            - defines a service __S__ protected with password __P__, if the service is started, then a process is created by spawning `SomeMod:SomeFunc(MM, ArgsC, SomeArgsS)`__MM__ is the PID of a proxy process that can send messages to the client, and __ArgsC__ comes from the client connect call
        - `connect(Host, Port, S, P, ArgsC)` tries to open __Port__ on __Host__, and then tries to activate service __S__, with password __P__, if password is correct, `{ok, Pid}` is returned, where __Pid__ is the proxy process to send messages to from the client
    - two proxy processes are created for the client and the server
    - check __mod\_name\_server__ for an example
        - if a client sends the message `{send, X}` it will arrive to the server as `{chan, MM, X}`
        - if the client terminates, or the communication with it breaks, a message like this will be received `{chan_closed, MM}`
        - to send message __X__ back to the client use `MM ! {send, X}`
        - to close the connection from the server `MM ! close`
        - to test
        ```
        kvs:start().
            true
        lib_chan:start_server().
            Starting a port server on 1234...
        ```
        ```
        {ok, Pid} = lib_chan:connect("localhost", 1234, nameServer, "ABXy45", "").
            {ok, <0.43.0>}
        lib_chan:cast(Pid, {store, joe, "writing a book"}).
            {send, {store, joe, "writing a book"}}.
        lib_chan:rpc(Pid, {lookup, joe}).
            {ok, "writing a book"}
        lib_chan:rpc(Pid, {lookup, jim}).
            undefined
        ```