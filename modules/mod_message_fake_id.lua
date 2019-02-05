local st = require "util.stanza";
local uuid_generate = require "util.uuid".generate;


local function on_message(event)
	if not event.origin.username then
		return nil;
	end

	if not event.stanza.attr.id then
		module:log("debug", "Faking message ID.");
		event.stanza.attr.id = uuid_generate();
	end
end


-- outgoing
module:hook("pre-message/bare", on_message, 5432);
module:hook("pre-message/full", on_message, 5432);
module:hook("pre-message/host", on_message, 5432);

