import XMonad

main = do
  xmonad $ defaultConfig {
    modMask = mod4Mask, -- Change Meta key to 'Command'
    borderWidth = 0,
    focusFollowsMouse = False
  }
