import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do

  xmproc <- spawnPipe "xmobar"

  xmonad $ defaultConfig {
    layoutHook = avoidStruts $ layoutHook defaultConfig, -- keep xmobar visible
    modMask = mod4Mask, -- Change Meta key to 'Command'

		terminal = "urxvt",

    borderWidth = 1,
		normalBorderColor = "#4d4d4d",
		focusedBorderColor = "#4d4d4d",

    focusFollowsMouse = False,

		logHook = fadeInactiveLogHook 0.6  -- fade inactive windows


  }
