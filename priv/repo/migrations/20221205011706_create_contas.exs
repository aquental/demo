defmodule Demo.Repo.Migrations.CreateContas do
  use Ecto.Migration

  def change do
    create table(:contas) do
      add :number, :string
      add :owner, :string
      add :balance, :integer

      timestamps()
    end
  end
end
