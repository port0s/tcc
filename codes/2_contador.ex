# Agent,
# abstração simples
# que permite armazenar o estado do processo

# Desconhecer o estado de um processo, 
# pode ocasionar em um encerramento repentino da máquina virtual.

# start_link, que permite vincular processos
# no caso, o processo atual - IEx 
# e o processo iniciado - representado por pid_do_contador
{:ok, pid_do_contador} = Agent.start_link(fn -> 0 end)

Agent.update(pid_do_contador, fn estado -> estado + 1 end)

Agent.get(pid_do_contador, &(&1))

Agent.update(pid_do_contador, fn estado -> estado + 1 end)

Agent.get(pid_do_contador, &(&1))
