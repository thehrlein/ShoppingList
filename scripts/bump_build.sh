echo "start bumping build number"
set -e

# Find and increment the version number.
perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' pubspec.yaml

# Commit and tag this change.
version=$(grep 'version: ' pubspec.yaml | sed 's/version: //')
echo "✅  Success - version updated: $version"
