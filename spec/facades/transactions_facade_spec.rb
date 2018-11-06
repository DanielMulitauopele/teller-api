require 'rails_helper'

describe TransactionFacade do
  it "should list out all recent transactions" do
    tx = TransactionFacade.new
    transactions = tx.transactions

    expect(transactions).to be_an(Array)
    expect(transactions.first).to be_a(Transaction)
    expect(transactions.last).to be_a(Transaction)
  end
end
