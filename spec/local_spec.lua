require("busted")

insulate("should only see local confdir", function()
	setup(function()
		xx = require("uci")
		print("setup local uci.confdir = " .. tostring(xx.get_confdir()))
		xx.set_confdir("/home/karlp/src/busted-how/confdir")
	end)
	teardown(function()
		print("teardown local uci.confdir = " .. tostring(xx.get_confdir()))
	end)
	it("do styuff", function()
		require("src.blah")
		assert.are.same("from_local_config", uci_get_first("busted", "fishy", "hatred"))
	end)
end)