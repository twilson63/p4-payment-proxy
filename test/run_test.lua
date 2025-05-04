require('test/helpers/init')
T = require('apm_modules/@rakis/test-unit/source').new('Payment Proxy Tests')

require('test/deposit_test')
require('test/withdraw_test')

T:add('ok', function ()
  assert(true, 'should pass')
end)

print(
  T:run()
)
