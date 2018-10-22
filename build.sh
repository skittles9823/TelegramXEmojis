#! /bin/sh
set -e

mkdir -p spritegenerator/emojidata
mkdir -p spritegenerator/out
cd spritegenerator/emojidata

npm install emoji-datasource-google
npm install emoji-datasource-twitter
npm install emoji-datasource-facebook
npm install emoji-datasource-messenger
npm install emoji-datasource-emojione

if [[ "$(uname -s)" == MINGW* ]]; then
    echo "Setting python alias"
    alias python3.6="py -3"
fi

cd .. # spritegenerator
python3.6 -m pip install -r requirements.txt --user
python3.6 tgxspritegen.py google
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_Oreo_Emojis/emoji
echo "Google emojis built"
python3.6 tgxspritegen.py twitter
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_Twitter_Emojis/emoji
echo "Twitter emojis built"
python3.6 tgxspritegen.py messenger
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_Messenger_Emojis/emoji
echo "Messenger emojis built"
python3.6 tgxspritegen.py facebook
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_Facebook_Emojis/emoji
echo "Facebook emojis built"
python3.6 tgxspritegen.py emojione
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_EmojiOne_Emojis/emoji
echo "EmojiOne emojis built"
python3.6 -m pip install -r requirements.txt --user
python3.6 tgxspritegen.py google
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_Oreo_Emojis/emoji
echo "Google emojis built"
python3.6 tgxspritegen.py twitter
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_Twitter_Emojis/emoji
echo "Twitter emojis built"
python3.6 tgxspritegen.py messenger
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_Messenger_Emojis/emoji
echo "Messenger emojis built"
python3.6 tgxspritegen.py facebook
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_Facebook_Emojis/emoji
echo "Facebook emojis built"
python3.6 tgxspritegen.py emojione
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_EmojiOne_Emojis/emoji
echo "EmojiOne emojis built"
python3.6 tgxspritegen.py abomimoji
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_Abomimoji/emoji
echo "Abomimoji built"

cd emojidata
npm install emoji-datasource-google@3.0.0
cd ..

# copying oreo emojis to original so we can use them as the fallback
cp -r original/ original-old/
cp -r ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_Oreo_Emojis/emoji/* original/
python3.6 tgxspritegen.py google
mv out/* ../app/src/main/assets/overlays/org.thunderdog.challegram/type4_›_Blob_Emojis/emoji
cp -r original-old/* original/
rm -rf original-old
echo "Blob emojis built"

cd .. # root directory
./gradlew assembleRelease