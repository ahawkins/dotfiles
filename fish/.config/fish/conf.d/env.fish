# NOTE: this should be handled in the pam_environment. This is
# less straight forward on nixos because you cannot appened to
# to PATH, only set it. NixOS uses many extra directories, so
# it's safer to avoid setting them manually. This is the easiest
# thing that works, but it is not the most correct.
set -x PATH ~/.local/bin $PATH
