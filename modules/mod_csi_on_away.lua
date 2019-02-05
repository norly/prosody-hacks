local st = require "util.stanza";


-- Make sure we only load this module when CSI itself is deployed
module:depends("csi");


local function on_presence(event)
	if not event.origin.username then
		return nil;
	end

	local child = event.stanza:get_child("show");

	if child and child:get_text() == "away" then
		module:log("debug", "User is now away, simulating CSI.");
		module:fire_event("csi-client-inactive", event);
	else
		module:log("debug", "User is no longer away, ending simulated CSI.");
		module:fire_event("csi-client-active", event);
	end
end


-- outgoing
module:hook("pre-presence/bare", on_presence);
module:hook("pre-presence/full", on_presence);
module:hook("pre-presence/host", on_presence);

