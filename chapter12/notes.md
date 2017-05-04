# Concurrent Programming
- there are 3 primitives
    - spawn, creates a parallel process
    - send, sends a message to a process
    - receive, receives messages from other processes
- processes are self contained virtual machines that can evaluate functions
- in Erlang processes are a concept of the language, not the os
- Erlang is considered a pure message passing language, it is the only way two process can communicate

## Concurrency Primitives

```
Pid = spawn(Mod, Func, Args)
```
- this creates a new process in parallel with the caller
- it returns a PID
- the function _Func_ with arity _length(Args)_ must be exported from the module _Mod_
    - when used the latest version of the module is used

```
Pid = spawn(Fun)
```
- this creates a new concurrent process that evalutes Fun()
- runs the value of the fun being evaluated
- doesn't need to be exported

- The difference between the two, is the dynamic code upgrade.

```
Pid ! Message
```
- Send _Message_ to process with identifier _Pid_ asynchronously 

```
receive 
    Pattern1 [when Guard1] ->
        Expressions1;
    Pattern2 [when Guard2] ->
        Expressions2;
    ...
end
```
- when a message arrives a receive statement, the message is matched agains the patterns in order, and optionally some guards
- when a message doesn't match with any clause, it is saved for later
- the mailbox that receives the messages is also created when a process is spawned
- the returned value from ! is the same message

## Introducing Client Server
- in erlang, the client and server are processes
- client server interaction requires that the server receives the address of the client in order to reply the message
```
Pid ! {self(), {rectangle, 6, 10}}
```
- the following is the code that receives the message
```
loop() ->
    receive
        {From, {rectangle, Width, Ht}} ->
            From ! Width * Ht,
            loop();
        ...
```
- is recommended to always respond to a client, even when the message is not processed by the logic of the receive
- the following is the abstraction of an RPC
```
rpc(Pid, Request) ->
    Pid ! {self(), Request}
    receive
        Response ->
            Response
    end
```
- view the file area_server1.erl to check the whole thing
- to verify the source, include the Pid of the Server in the response `From ! {self(), ...}`
