package.path = string.format("?.lua;%s", package.path)

local request = require 'mongrel2.request'

local payloads = {}

context('m2-lua', function()
    context('request', function()
        context('parser sanity', function()
            for msg in io.lines('tests/request_payloads.txt') do
                 test(msg, function()
                     local req, err = request.parse(msg)
                     assert_nil(err)
                     assert_not_nil(req)
                 end)
            end
        end)
    end)
end)

-- Alternatively, without Telescope, this could be written like this:
--
-- for line in io.lines('tests/request_payloads.txt') do
--     local req, err = request.parse(line)
--     print(line)
--     assert(not err)
--     assert(req)
-- end
--
-- If you run this with plain Lua, it will exit in the first failed
-- assertion. If you run it with Shake, then it will run all the
-- tests and report the successes and failures.
