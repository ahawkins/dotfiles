function fish_setup --description 'Setup fish variables'
  set -U fish_greeting

  set -Ux EDITOR vim
  set -Ux BUNDLE_EDITOR mate

  # Abbreviations
  fish_user_abbreviations

  set -U fish_setup_done 1
  echo 'Initial fish setup done!'
end
