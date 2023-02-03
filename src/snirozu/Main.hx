package snirozu;

import org.bukkit.plugin.java.JavaPlugin;

class Main extends JavaPlugin {
    @:overload
    override public function onEnable() {
        super.onEnable();

		getCommand("hellohaxe").setExecutor(new HelloHaxeCommand());

        getServer().getPluginManager().registerEvents(new EventListener(), this);

        getLogger().info("Hello World!");
    }
}