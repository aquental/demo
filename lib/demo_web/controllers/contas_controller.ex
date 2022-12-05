defmodule DemoWeb.ContasController do
  use DemoWeb, :controller

  alias Demo.Banks
  alias Demo.Banks.Contas

  def index(conn, _params) do
    contas = Banks.list_contas()
    render(conn, "index.html", contas: contas)
  end

  def new(conn, _params) do
    changeset = Banks.change_contas(%Contas{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"contas" => contas_params}) do
    case Banks.create_contas(contas_params) do
      {:ok, contas} ->
        conn
        |> put_flash(:info, "Contas created successfully.")
        |> redirect(to: Routes.contas_path(conn, :show, contas))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    contas = Banks.get_contas!(id)
    render(conn, "show.html", contas: contas)
  end

  def edit(conn, %{"id" => id}) do
    contas = Banks.get_contas!(id)
    changeset = Banks.change_contas(contas)
    render(conn, "edit.html", contas: contas, changeset: changeset)
  end

  def update(conn, %{"id" => id, "contas" => contas_params}) do
    contas = Banks.get_contas!(id)

    case Banks.update_contas(contas, contas_params) do
      {:ok, contas} ->
        conn
        |> put_flash(:info, "Contas updated successfully.")
        |> redirect(to: Routes.contas_path(conn, :show, contas))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", contas: contas, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    contas = Banks.get_contas!(id)
    {:ok, _contas} = Banks.delete_contas(contas)

    conn
    |> put_flash(:info, "Contas deleted successfully.")
    |> redirect(to: Routes.contas_path(conn, :index))
  end
end
