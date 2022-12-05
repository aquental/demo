defmodule Demo.Banks.Contas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contas" do
    field :balance, :integer
    field :number, :string
    field :owner, :string

    timestamps()
  end

  @doc false
  def changeset(contas, attrs) do
    contas
    |> cast(attrs, [:number, :owner, :balance])
    |> validate_required([:number, :owner, :balance])
  end
end
