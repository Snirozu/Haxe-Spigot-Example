import haxe.zip.Entry;
import haxe.zip.Writer;
import sys.io.File;
import haxe.zip.Reader;
import sys.FileSystem;

using StringTools;

/**
 * Maybe not the best way to include jars idfk?
 * aka fat jar generator
 */
class IncludeJars {

	public static final binJarLocation = "bin/HaxeHello.jar";

    /**
     * Add your libraries here, for ex. `com.example.spigotplugin`
     */
    public static final addLibrary:Array<String> = [
	    "com.github.stefvanschie.inventoryframework"
    ];

	public static final doLog = false;

    public static function main() {
		Sys.println("INFO: Including jars...");
		var entries:List<Entry> = new List<Entry>();
        
		var _jarReader = File.read(binJarLocation, true);
		var jarReader = new Reader(_jarReader);
		for (entry in jarReader.read()) {
			entries.push(entry);
		}
		_jarReader.close();

		var jarWriter = new Writer(File.write(binJarLocation, true));

		for (_file in FileSystem.readDirectory("lib/implementation")) {
			var file = 'lib/implementation/$_file';
			var reader = new Reader(File.read(file, true));

			// READ LIB ENTRIES
			for (entry in reader.read()) {
				if (entry.fileName.startsWith("META-INF"))
					continue;

				var pckg = entry.fileName.replace("/", ".");

				if (pckg.endsWith("."))
					pckg = pckg.substring(0, pckg.length - 1);

				if (/*pckg.endsWith(".class") && */startsWithArray(pckg, addLibrary)) {
					if (doLog) Sys.println("FOUND: " + pckg);
					entries.push(entry);
				}
			}
		}

		jarWriter.write(entries);
    }

    static function startsWithArray(string:String, array:Array<Any>):Bool {
        if (array.contains(string)) return true;

        for (piss in array) {
            if (string.startsWith(piss))
                return true;
        }

        return false;
    }
}