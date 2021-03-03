echo "Prepare release"
sh scripts/bump_build.sh
sh scripts/deploy_web.sh
git add pubspec.yaml
git add .firebase/hosting.*

while getopts m: flag; do
  case "${flag}" in
  m) message=${OPTARG} ;;
  *) ;;
  esac
done

if [ -z "$message" ]; then
  echo "Not committing"
else
  echo "Commit Message: $message"
  git commit -m "$message"
  git push
fi

echo "✅  Success - release prepared"
