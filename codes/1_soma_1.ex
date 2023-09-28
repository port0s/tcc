# :timer.sleep(time_in_miliseconds)
# 10 * 1000 == 10 * 1000 miliseconds = 10 * 1 segundo = 10 segundos
sem_task = fn -> :timer.sleep(10 * 1000) ; 1 + 1 end
sem_task.()

# Tasks, 
# convenientemente usadas para computar
# código sequencial de maneira concorrente. 
# Isso, tendo a possibilidade de executar
# em segundo plano.
# um código em segundo plano.
com_task = Task.async(fn -> :timer.sleep(10 * 1000) ; 1 + 1 end)
Task.await(com_task)
