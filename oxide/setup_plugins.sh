SCRIPT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
PLUGINS=$(egrep -v "^#" ${SCRIPT_PATH}/plugins.txt)
PLUGIN_DIRECTORY=${SCRIPT_PATH}/serverfiles/oxide/plugins/

mkdir -vp ${PLUGIN_DIRECTORY}

for plugin in $PLUGINS; do
        echo "Installing... ${plugin}";
        wget -qO ${PLUGIN_DIRECTORY}/${plugin}.cs https://umod.org/plugins/${plugin}.cs
done
