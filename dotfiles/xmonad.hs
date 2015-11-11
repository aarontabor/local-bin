import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do

  xmproc <- spawnPipe "xmobar"

  xmonad $ defaultConfig {
    layoutHook = avoidStruts $ layoutHook defaultConfig, -- keep xmobar visible
    modMask = mod4Mask, -- Change Meta key to 'Command'

    borderWidth = 0,
    normalBorderColor = "#000000",
    focusedBorderColor = "#ffffff",
    focusFollowsMouse = False
  }
