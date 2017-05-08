# Chapter 13: Errors in Concurrent Programs
- the focus of multiple processes is corrective code, since a process can help when another fails
## Error handling philosophy
- let the processes die, and handle elsewhere
- assume that thins will fail, keep being responsive while correcting, don't let the user feel the downtime
- Let some other process fix the error
    - creating __links__ or __monitors__, will cause that processes dying inform the linked processes.
    - this characteristic is inherent to fault tolerant systems
- Let it crash
    - the part that solves the problem doesn't care about error handling
    - there is a part of the software that cares about failure, but of processes different that itself, and the logic of correction is often generic.
- Why Crash immediately
    - You won't make things worse trying to do additional things after failing
    - Code is simpler
    - You just care about cleaning after yourself
## Error handling semantics
- kinds of processes
    - normal processes, the ones we spawn
    - system processes, the ones flagged with `process_flag(trap_exit, true)`
- links will bind to processes, when A and B are linked, if A dies B gets notified, and the other way around.
- monitors are similar to links, but unidirectional
- error signals are sent to the link created for a Processes
- when a process die the message send over its links is of the form `{'EXIT', Pid, Why}`, __Why__ is equals to normal, when the process exits as expected and not by an error
- `exit(Pid, kill)` will send a fake exit signal to a process, the one sending it doesn't die
- when the Reason of exit is `kill` the process cannot trap the signal
## Creating links
- use `link(Pid)` to link the caller process with the one with the Pid
## Froups of Processes That All Die Together
- exit signals are propagated among normal processes
## Setting Up a Firewall
- using trap exits, will stop the propagation of exit signals
## Monitors
- when a monitored process dies a down signal is sent, not an exit, in that way the monitoring process doesn't need to be of the system kind
## Error Handling Primitives
- `spawn_link(Fun)` and `spawn_link(Mod, Func, Args)` spawn and then link, in an atomic operation
- `spawn_monitor(Fun)` and `spawn_monitor(Mod, Func, Args)` spawn and then monitor, in an atomic operation
- both operations return a tuple `{Pid, Ref}`, where Pid is the process id of the spawned module or function, and Ref is a reference to the monitor
- `process_flag(trap_exit, true)` turns a process into a system process
- `link(Pid)`
- `unlink(Pid)`
- `erlang:monitor(process, Item)`, Item is the Pid of the process to monitor
- `demonitor(Ref)`
- `exit(Why)`, causes the current Process to exit with reason __Why__
- `exit(Pid, Why)`, kills the Process with __Pid__

## Programming for Fault Tolerance
The functions referenced in this section are located in the module __lib\_misc__
- `on_exit(Pid, Fun)`
    - monitor process with __Pid__ and performs __Fun__ when it dies
- `start(Fs)`
    - receives a list of functions on __Fs__ and spawn and link to them, if any of them die, the rest die as well, if we want to know when will this happen, we use the Pid returned by this and monitore it with _on\_exit_
- `keep_alive(Name, Fun)`
    - spawn a Process with __Fun__ and registered it to __Name__, if the process dies, a monitor action will spawn the process again with the same __Fun__ and same __Name__
