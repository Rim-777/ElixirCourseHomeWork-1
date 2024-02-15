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
      iex> Calculator.call(:subtract, 5, 3)
      2
      iex> Calculator.call(:multiply, 2, 3)
      6
      iex> Calculator.call(:divide, 6, 3)
      2.0
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

  @impl GenServer
  def handle_call({:add, num_1, num_2}, _from, state) do
    {:reply, num_1 + num_2, state}
  end

  @impl GenServer
  def handle_call({:subtract, num_1, num_2}, _from, state) do
    {:reply, num_1 - num_2, state}
  end

  @impl GenServer
  def handle_call({:multiply, num_1, num_2}, _from, state) do
    {:reply, num_1 * num_2, state}
  end

  @impl GenServer
  def handle_call({:divide, num_1, num_2}, _from, state) do
    {:reply, num_1 / num_2, state}
  end
end
