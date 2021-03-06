#!/usr/bin/env sh
upload(){
curl -s -F 'file=@'"$1" "https://pixeldrain.com/api/file" >/dev/null 2>&1
DOWNLOAD='https://pixeldrain.com/api/file/'$(curl -s -F 'file=@'"$1" "https://pixeldrain.com/api/file" | cut -d '"' -f 4)'?download'
}
upload TelegramXEmojis-$TRAVIS_BUILD_NUMBER.apk
curl -F chat_id="-1001220326034" -F text="$(./scripts/changelog.sh)" -F parse_mode="HTML" https://api.telegram.org/bot$BOT_TOKEN/sendMessage
curl -F chat_id="-1001220326034" -F text="$DOWNLOAD" -F parse_mode="HTML" https://api.telegram.org/bot$BOT_TOKEN/sendMessage
curl -F chat_id="-1001269732220" -F text="$(./scripts/changelog.sh)" -F parse_mode="HTML" https://api.telegram.org/bot$BOT_TOKEN/sendMessage
#curl -F chat_id="-1001343279107" -F sticker="CAADBQADPQADTBCSGr060PvRNzIFAg" https://api.telegram.org/bot$BOT_TOKEN/sendSticker
#curl -F chat_id="-1001343279107" -F text="$(./scripts/changelog.sh)" -F parse_mode="HTML" https://api.telegram.org/bot$BOT_TOKEN/sendMessage
#curl -F chat_id="-1001343279107" -F text="$(./scripts/changelog.sh)" -F parse_mode="HTML" https://api.telegram.org/bot$BOT_TOKEN/sendMessage
