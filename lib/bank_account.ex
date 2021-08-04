defmodule BankAccount do

  defstruct  movements: []

  def create() do
    %BankAccount{}
  end

  def get_balance(bank_account) do
    Enum.reduce(
      bank_account.movements,
      0,
      fn el, acc ->
        el.amount + acc
      end
    )
  end

  def deposit(bank_account, movement) do
    %BankAccount{
      movements: bank_account.movements ++ [movement]
    }
  end
end
