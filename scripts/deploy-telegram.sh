#!/usr/bin/env sh
cp /app/build/outputs/apk/app-debug.apk
cp /app/build/outputs/mapping/mapping.txt
 
curl -F chat_id="-1001220326034" -F document=@"app-debug.apk" https://api.telegram.org/bot$BOT_TOKEN/sendDocument
curl -F chat_id="427673272" -F document=@"proguard.txt" https://api.telegram.org/bot$BOT_TOKEN/sendDocument
 
cp /app/build/outputs/mapping/release/mapping.txt
curl -F chat_id="427673272" -F document=@"proguard-release.txt" https://api.telegram.org/bot$BOT_TOKEN/sendDocument
 
 