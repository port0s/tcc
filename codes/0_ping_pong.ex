# Associa o PID do IEx a uma variável
# A Função self() permite retornar o PID do processo que a chamou
# Neste caso, o PID do IEx
# Allowed in guard clauses. Inlined by the compiler. guard: true
pid_do_processo_pai = self() 

# Criação de um novo processo
# spawn() cria um processo
# send(destino, mensagem) envia para um processo
pid_do_processo_filho = spawn fn -> send(pid_do_processo_pai, {:ping, pid_do_processo_pai}) end

# Espera a recepção de alguma informação
# A macro receive fica esperando uma mensagem, 
# para verificar se o padrão enviado
# casa com o buscado dentro da mailbox 
receive do
 {:ping, pid_do_processo_pai} ->
  {:pong, pid_do_processo_pai, pid_do_processo_filho} ->
end

