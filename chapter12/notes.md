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
## Processes Are Cheap
- `erlang:system_info(process_limit)` gets the maximum allowd processes
- testing the creation of 20.000 processes with a core i7 at 2.9GHz per core takes 3 microseconds using `processes.erl`
- to modify the ammount of maximum processes you ned to use the `+P` flag when running erlang.

## Receive with a timeout
- we can add a timeout to the receive statement in order to avoid deadlocks
```
receive
    Pattern1 [when Guard1] ->
        Expressions1;
    Pattern2 [when Guard2] ->
        Expressions2;
    ...
    after Time ->
        Expressions
    end
```
- if no matching message has arrived within __Time__ milliseconds, then the process stop waiting and evaluates __Expressions__
- you can define a receive only with after
- you can define a timeout of 0 milliseconds to flush the unwanted messages, the match clauses are tried before the timeout
## Selective receiver
- when a message is not matched, it is placed in a save queue, after the timeout is passed, the messages are put back in the message queue
## Registered Processes
- when a process is created only the parent knows about the existence of it, but there are means of registering a process, so it is accessible from other processes without the need of introduction
- the following are the bifs related to this process
    - register(AnAtom, Pid)
    - unregister(AnAtom)
    - whereIs(AnAtom) -> Pid | undefined
        - finds out whether a process is registered or not
    - registered() -> [AnAtom::atom()]
        - a list of all registered processes
## A World About Tail Recursion
- if the last statement is a recursion, it is represented as a jump, so there is no stack consumption
## Spawning with MFAs or Funs
- spawning with an MFA is the way to ensure the code updrage mechanism