defmodule Calculator do
  use GenServer

  @moduledoc """
  Documentation for `Calculator`.
  """

  @doc """
  Calculator GenServer.

  ## Examples
      iex> Calculator.start_link
      iex> Calculator.call(:add, 1, 2)
      3
  """

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl GenServer
  def init(_args) do
    {:ok, 0}
  end

  def call(operation, num_1, num_2) do
    GenServer.call(__MODULE__, {operation, num_1, num_2})
  end

  def call(operation, num) do
    GenServer.call(__MODULE__, {operation, num})
  end

  def call(:reset) do
    GenServer.call(__MODULE__, :reset)
  end

  @impl GenServer
  def handle_call({:add, num_1, num_2}, _from, _state) do
    new_satate = num_1 + num_2
    {:reply, new_satate, new_satate}
  end

  @impl GenServer
  def handle_call({:add, num}, _from, state) do
    new_state = state + num
    {:reply, new_state, new_state}
  end

  @impl GenServer
  def handle_call({:subtract, num_1, num_2}, _from, _state) do
    new_state = num_1 - num_2
    {:reply, new_state, new_state}
  end

  @impl GenServer
  def handle_call({:subtract, num}, _from, state) do
    new_state = state - num
    {:reply, new_state, new_state}
  end

  @impl GenServer
  def handle_call({:multiply, num_1, num_2}, _from, _state) do
    new_state = num_1 * num_2
    {:reply, new_state, new_state}
  end

  @impl GenServer
  def handle_call({:multiply, num}, _from, state) do
    new_state = state * num
    {:reply, new_state, new_state}
  end

  @impl GenServer
  def handle_call({:divide, _num, 0}, _from, state) do
    unproccessable_operation(state)
  end

  @impl GenServer
  def handle_call({:divide, 0}, _from, state) do
    unproccessable_operation(state)
  end

  def handle_call({:divide, num_1, num_2}, _from, _state) do
    new_state = num_1 / num_2
    {:reply, new_state, new_state}
  end

  @impl GenServer
  def handle_call({:divide, num}, _from, state) do
    new_state = state / num
    {:reply, new_state, new_state}
  end

  @impl GenServer
  def handle_call(:reset, _from, _state) do
    {:reply, 0, 0}
  end

  defp unproccessable_operation(state) do
    {:reply, :unproccessable, state}
  end
end
