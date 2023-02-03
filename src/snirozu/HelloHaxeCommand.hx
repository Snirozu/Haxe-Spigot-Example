package snirozu;

import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;
import com.github.stefvanschie.inventoryframework.gui.GuiItem;
import com.github.stefvanschie.inventoryframework.pane.OutlinePane;
import org.bukkit.event.inventory.InventoryClickEvent;
import java.util.function.Consumer;
import com.github.stefvanschie.inventoryframework.gui.type.ChestGui;
import org.bukkit.ChatColor;
import org.bukkit.command.CommandSender;
import org.bukkit.command.Command;
import java.NativeArray;
import org.bukkit.command.CommandExecutor;

class HelloHaxeCommand implements CommandExecutor {
	public function onCommand(sender:CommandSender, command:Command, label:String, args:NativeArray<String>):Bool {
        if (args.length > 0 && args[0] == "secret") {
			var gui:ChestGui = new ChestGui(3, "Super Secret");
			
			var background = new OutlinePane(0, 0, 9, gui.getRows(), LOWEST);
			background.addItem(new GuiItem(new ItemStack(Material.GRAY_STAINED_GLASS_PANE)));
			background.setRepeat(true);
			gui.addPane(background);

			var cum:Consumer = cast((event:InventoryClickEvent) -> {
                event.setCancelled(true);
            }, Consumer<Dynamic>);
			gui.setOnGlobalClick(cast cum);

			var pane = new OutlinePane(4, 1, 1, 1);
			pane.addItem(new GuiItem(new ItemStack(Material.DIAMOND)));
			gui.addPane(pane);

            gui.show(cast sender);
        }

		sender.sendMessage('${ChatColor.GOLD}Hello ${sender.getName()}!');
		return true;
	}

	public function new() {}
}