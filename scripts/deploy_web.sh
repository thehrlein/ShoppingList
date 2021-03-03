echo "start deploying web version"
echo "1. build web"
flutter build web
echo "2. deploy firebase"
firebase deploy
echo "✅  Success - deployed web version"
