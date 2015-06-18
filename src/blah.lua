

uci = require("uci")

function uci_get_first(config, type, option, default)
    local value
    local first = true
    print(string.format("uci= %s, confdir=%s", tostring(uci), uci.get_confdir()))
    uci.foreach(config, type, function(s)
        if first then
            first = false
            if option then
                value = s[option]
            else
                value = s
            end
        end
    end)
    return value or default
end
