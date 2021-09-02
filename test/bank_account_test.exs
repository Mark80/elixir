defmodule BankAccountTest do
  use ExUnit.Case

  describe "Bank account should" do
    test "have balance at zero when it's create" do
      bank_account = BankAccount.create()
      assert BankAccount.get_balance(bank_account) == 0
    end

    test "add a deposit" do
      bank_account = BankAccount.create()
                     |> BankAccount.make_operation(%{amount: 100, date: "24-10-80"})
      assert BankAccount.get_balance(bank_account) == 100
    end

    test "add 2 deposits" do
      bank_account = BankAccount.create()
                     |> BankAccount.make_operation(%{amount: 100, date: "24-10-80"})
                     |> BankAccount.make_operation(%{amount: 10, date: "25-10-80"})
      assert BankAccount.get_balance(bank_account) == 110
      assert bank_account.movements == [%{amount: 100, date: "24-10-80"}, %{amount: 10, date: "25-10-80"}]
    end

    test "return zero balance if make a withdraw equals to amount" do
      bank_account = BankAccount.create()
                     |> BankAccount.make_operation(%{amount: 100, date: "24-10-80"})
                     |> BankAccount.make_operation(%{amount: 10, date: "25-10-80"})
                     |> BankAccount.make_operation(%{amount: -110, date: "25-10-80"})
      assert BankAccount.get_balance(bank_account) == 0


    end

  end
end
