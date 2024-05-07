#!/opt/homebrew/bin/bash

# Setup
if ! [ -d ./assets/$1 ]; then
    mkdir ./assets/$1
    if ! [ -d ./assets/$1/slides ]; then
        mkdir ./assets/$1/slides
    fi
    if ! [ -d ./assets/$1/data ]; then
        mkdir ./assets/$1/data
    fi
    echo "Had to create an assets directory for this chapter."
else
    echo "Asset directory for the chapter exists."
fi
if ! [ -f ./scripts/$1.sh ]; then
    echo '#!/opt/homebrew/bin/bash' > ./scripts/$1.sh
else
    echo "Chapter is already setup."
fi
