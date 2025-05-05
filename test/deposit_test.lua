require('src/p4-payment-proxy')
Node = "node"
Operator = "operator"

T:add('deposit test', function () 
  Handlers.evaluate({
    Target = "PaymentProxy",
    Action = "Credit-Notice",
    From = "0syT13r0s0tgPmIed95bJnuSqaD29HQNN8D3ElLSrsc",
    Sender = "Router",
    Quantity = "10000",
    ["Block-Height"] = "30000000"
  })
  assert(Balances["Router"] == "10000", "deposit was made")
  assert(#Locked == 1, "Deposit added to locked table")
  -- verify message was sent to node
  assert(Outbox[1].quantity == "10000", "quantity sent")
  Outbox = {}
end)
