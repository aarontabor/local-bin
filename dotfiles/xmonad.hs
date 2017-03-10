import XMonad
import XMonad.ManageHook
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Spacing
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do

  xmproc <- spawnPipe "xmobar"

  xmonad $ ewmh defaultConfig {
    layoutHook = smartSpacing 10 $ avoidStruts $ layoutHook defaultConfig, -- keep xmobar visible
    modMask = mod4Mask, -- Change Meta key to 'Command'

    terminal = "urxvtc",

    borderWidth = 0,
    normalBorderColor = "#4d4d4d",
    focusedBorderColor = "#4d4d4d",

    focusFollowsMouse = False,

    logHook = fadeInactiveLogHook 0.95,  -- fade inactive windows

    manageHook = composeAll [ className =? "processing-core-PApplet" --> doFloat ] -- float Processing windows by default
  }
