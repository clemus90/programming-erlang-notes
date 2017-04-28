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
receive ... end
```

