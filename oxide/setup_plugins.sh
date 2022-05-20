PLUGINS=$(egrep "^#" plugins.txt)
PLUGIN_DIRECTORY=./plugins/


mkdir -vp ${PLUGIN_DIRECTORY}

for plugin in $PLUGINS; do
        echo "Installing... ${plugin}";
        wget -qO ${PLUGIN_DIRECTORY}/${plugin}.cs https://umod.org/plugins/${plugin}.cs
done
