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
