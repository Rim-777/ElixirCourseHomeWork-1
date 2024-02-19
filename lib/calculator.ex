defmodule Calculator do
  use GenServer

  @acceptable_opperations [:add, :subtract, :multiply, :divide]

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

  def call(:divide, _num_1, 0) do
    :unproccessable
  end

  def call(operation, num_1, num_2)
      when operation in @acceptable_opperations and is_number(num_1) and is_number(num_2) do
    GenServer.call(__MODULE__, {operation, num_1, num_2})
  end

  def call(_operation, _num_1, _num_2) do
    :unproccessable
  end

  def call(:divide, 0) do
    :unproccessable
  end

  def call(operation, num)
      when operation in @acceptable_opperations and is_number(num) do
    GenServer.call(__MODULE__, {operation, num})
  end

  def call(_operation, _num) do
    :unproccessable
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
end
