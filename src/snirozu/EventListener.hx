package snirozu;

import org.bukkit.event.player.AsyncPlayerChatEvent;
import net.md_5.bungee.api.ChatColor;
import org.bukkit.event.Listener;

using StringTools;

class EventListener implements Listener {
	@:meta(org.bukkit.event.EventHandler())
	public function onChat(event:AsyncPlayerChatEvent) {
		event.setMessage(event.getMessage().replace("Haxe", ChatColor.translateAlternateColorCodes('&'.charCodeAt(0), "&6Haxe&r")));
	}

	public function new() {}
}
