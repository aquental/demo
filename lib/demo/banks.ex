defmodule Demo.Banks do
  @moduledoc """
  The Banks context.
  """

  import Ecto.Query, warn: false
  alias Demo.Repo

  alias Demo.Banks.Contas

  @doc """
  Returns the list of contas.

  ## Examples

      iex> list_contas()
      [%Contas{}, ...]

  """
  def list_contas do
    Repo.all(Contas)
  end

  @doc """
  Gets a single contas.

  Raises `Ecto.NoResultsError` if the Contas does not exist.

  ## Examples

      iex> get_contas!(123)
      %Contas{}

      iex> get_contas!(456)
      ** (Ecto.NoResultsError)

  """
  def get_contas!(id), do: Repo.get!(Contas, id)

  @doc """
  Creates a contas.

  ## Examples

      iex> create_contas(%{field: value})
      {:ok, %Contas{}}

      iex> create_contas(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_contas(attrs \\ %{}) do
    %Contas{}
    |> Contas.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a contas.

  ## Examples

      iex> update_contas(contas, %{field: new_value})
      {:ok, %Contas{}}

      iex> update_contas(contas, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_contas(%Contas{} = contas, attrs) do
    contas
    |> Contas.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a contas.

  ## Examples

      iex> delete_contas(contas)
      {:ok, %Contas{}}

      iex> delete_contas(contas)
      {:error, %Ecto.Changeset{}}

  """
  def delete_contas(%Contas{} = contas) do
    Repo.delete(contas)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking contas changes.

  ## Examples

      iex> change_contas(contas)
      %Ecto.Changeset{data: %Contas{}}

  """
  def change_contas(%Contas{} = contas, attrs \\ %{}) do
    Contas.changeset(contas, attrs)
  end
end
