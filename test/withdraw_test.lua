require('src/p4-payment-proxy')
Node = "node"
Operator = "operator"
Balances = {}
Locked = {}
Claimable = "10000"

T:add("withdraw test", function () 
  Handlers.evaluate({
    Target = "Proxy",
    Token = "0syT13r0s0tgPmIed95bJnuSqaD29HQNN8D3ElLSrsc",
    Action = "Withdraw",
    From = "operator",
    Quantity = "10000",
    ["Block-Height"] = "4000000"
  })
  assert(Claimable == "0", 'Claimable funds should be empty')

end)

