defmodule DataStructures.Stack do
  use GenServer

  @name StackServer

  ##################
  ### Client API ###
  ##################

  def start_link do
    GenServer.start_link(__MODULE__, %{elements: []}, name: @name)
  end

  def push(element) do
    GenServer.cast(@name, {:push, element})
  end

  def pop do
    GenServer.call(@name, :pop)
  end

  def peek do
    GenServer.call(@name, :peek)
  end

  def empty? do
    GenServer.call(@name, :empty)
  end

  def size do
    GenServer.call(@name, :size)
  end

  ##################
  ### Server API ###
  ##################

  def init(initial_state) do
    {:ok, initial_state}
  end

  def handle_cast({:push, element}, %{elements: elements}) do
    {:noreply, %{elements: [element | elements]}}
  end

  def handle_call(:pop, _from, state = %{elements: []}) do
    {:reply, nil, state}
  end

  def handle_call(:pop, _from, %{elements: [top | rest]}) do
    {:reply, top, %{elements: rest}}
  end

  def handle_call(:peek, _from, state = %{elements: []}) do
    {:reply, nil, state}
  end

  def handle_call(:peek, _from, state = %{elements: [top | _]}) do
    {:reply, top, state}
  end

  def handle_call(:empty, _from, state = %{elements: elements}) do
    {:reply, Enum.count(elements) == 0, state}
  end

  def handle_call(:size, _from, state = %{elements: elements}) do
    {:reply, Enum.count(elements), state}
  end
end
