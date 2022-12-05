defmodule Demo.BanksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Demo.Banks` context.
  """

  @doc """
  Generate a contas.
  """
  def contas_fixture(attrs \\ %{}) do
    {:ok, contas} =
      attrs
      |> Enum.into(%{
        balance: 42,
        number: "some number",
        owner: "some owner"
      })
      |> Demo.Banks.create_contas()

    contas
  end
end
