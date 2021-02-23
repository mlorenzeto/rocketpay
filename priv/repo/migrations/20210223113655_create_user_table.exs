defmodule Rocketpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  # o ecto consegue utilizar a função change tanto para fazer a criação da tabela quanto para realizar o rollback (remover a tabela)
  # caso queira, também é possível utilizar funções explicitas para criação (up) e rollback (down)

  def change do
    # o ecto por padrão já adiciona uma coluna id na criação de tabelas com tipo integer como default
    # para mudar o tipo default utilizado pelo ecto ao criar a coluna id basta seguir a config utilizada no arquivo config/config.exs
    create table :users do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string
      add :nickname, :string

      timestamps() # essa função cria automaticamente as colunas inserted_at e updated_at
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:nickname])
  end
end
