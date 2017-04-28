# Real-World Concurrency
> Programming sequentially is unnecesarily difficult, the world is concurrent
- Elrang was design to be concurrent
> Erlang programs model how we think and interact
- there is no shared memory
- to change the memory of someone else you need to send a message to her
- to check the state of memory of someone else, you need to ask her
- if you need to communicate to multiple people, you shout (broadcast)
> Distributed software systems with locks and keys always go wrong

> If somebody dies, other people will notice
- in Erlang, a process dying will shout what it has died from
- you don't know if a message has been delivered, if you need to know you need to ask for acknowledge