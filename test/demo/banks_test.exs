defmodule Demo.BanksTest do
  use Demo.DataCase

  alias Demo.Banks

  describe "contas" do
    alias Demo.Banks.Contas

    import Demo.BanksFixtures

    @invalid_attrs %{balance: nil, number: nil, owner: nil}

    test "list_contas/0 returns all contas" do
      contas = contas_fixture()
      assert Banks.list_contas() == [contas]
    end

    test "get_contas!/1 returns the contas with given id" do
      contas = contas_fixture()
      assert Banks.get_contas!(contas.id) == contas
    end

    test "create_contas/1 with valid data creates a contas" do
      valid_attrs = %{balance: 42, number: "some number", owner: "some owner"}

      assert {:ok, %Contas{} = contas} = Banks.create_contas(valid_attrs)
      assert contas.balance == 42
      assert contas.number == "some number"
      assert contas.owner == "some owner"
    end

    test "create_contas/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Banks.create_contas(@invalid_attrs)
    end

    test "update_contas/2 with valid data updates the contas" do
      contas = contas_fixture()
      update_attrs = %{balance: 43, number: "some updated number", owner: "some updated owner"}

      assert {:ok, %Contas{} = contas} = Banks.update_contas(contas, update_attrs)
      assert contas.balance == 43
      assert contas.number == "some updated number"
      assert contas.owner == "some updated owner"
    end

    test "update_contas/2 with invalid data returns error changeset" do
      contas = contas_fixture()
      assert {:error, %Ecto.Changeset{}} = Banks.update_contas(contas, @invalid_attrs)
      assert contas == Banks.get_contas!(contas.id)
    end

    test "delete_contas/1 deletes the contas" do
      contas = contas_fixture()
      assert {:ok, %Contas{}} = Banks.delete_contas(contas)
      assert_raise Ecto.NoResultsError, fn -> Banks.get_contas!(contas.id) end
    end

    test "change_contas/1 returns a contas changeset" do
      contas = contas_fixture()
      assert %Ecto.Changeset{} = Banks.change_contas(contas)
    end
  end
end
