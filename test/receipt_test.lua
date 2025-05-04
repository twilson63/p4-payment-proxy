require('src/p4-payment-proxy')
Node = "node"
Operator = "operator"
Balances = {
  Router = "10000"
}
Locked = {
  { Account = "Router", Quantity = "10000", Until = "400000" }
}
Claimable = "0"

T:add("receipt test", function () 
  Handlers.evaluate({
    Target = "Proxy",
    Action = "Receipt",
    From = "node",
    Signer= "Router",
    Quantity = "10000",
    ["Block-Height"] = "4000000"
  })
  assert(Claimable == "10000", 'Claimable funds should be available')
  assert(Balances["Router"] == "0", 'Account should be empty')


end)

