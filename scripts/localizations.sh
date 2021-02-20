echo
echo "Update localizations"
echo
flutter pub run gsheet_to_arb:import
echo
flutter pub run intl_utils:generate
echo
echo "✅  Success"