defmodule Stack do
      use GenServer

      # Server (callbacks)

      @impl true
      def init(stack) do
        {:ok, stack}
      end

      @impl true
      def handle_call(:pop, _from, [head | tail]) do
        {:reply, head, tail}
      end

      @impl true
      def handle_cast({:push, element}, state) do
        {:noreply, [element | state]}
      end


      # Client

      def start_link(default) when is_list(default) do
        GenServer.start_link(__MODULE__, default)
      end

      def pop(pid) do
        GenServer.call(pid, :pop)
      end

      def push(pid, element) do
        GenServer.cast(pid, {:push, element})
      end
end

# Inicia o servidor
    {:ok, pid_da_pilha} = Stack.start_link([])

    # Aqui é o cliente
    Stack.push(pid_da_pilha, 1)
    #=> :ok
    
    Stack.push(pid_da_pilha, 2)
    #=> :ok
    
    Stack.pop(pid_da_pilha)
    #=> 2
    
    Stack.pop(pid_da_pilha)
    #=> 1
