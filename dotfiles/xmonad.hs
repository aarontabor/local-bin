import XMonad
import XMonad.Actions.FloatKeys
import XMonad.ManageHook
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Fullscreen
import XMonad.Layout.Spacing
import XMonad.Util.CustomKeys(customKeys)
import XMonad.Util.Run(spawnPipe)
import System.IO

main = do

  xmproc <- spawnPipe "xmobar"

  xmonad $ fullscreenSupport $ ewmh defaultConfig {
    layoutHook = smartSpacing 10 $ avoidStruts $ layoutHook defaultConfig, -- keep xmobar visible
    modMask = mod4Mask, -- Change Meta key to 'Command'

    terminal = "urxvtc",

    borderWidth = 0,
    normalBorderColor = "#4d4d4d",
    focusedBorderColor = "#4d4d4d",

    focusFollowsMouse = False,

    logHook = fadeInactiveLogHook 0.95,  -- fade inactive windows

    manageHook = doFloat, -- float all windows by default

    keys = customKeys delkeys inskeys -- additional keymappings
  }

  where
    delkeys :: XConfig l -> [(KeyMask, KeySym)]
    delkeys XConfig {modMask = mod4Mask} =
      []

    inskeys :: XConfig l -> [((KeyMask, KeySym), X ())]
    inskeys conf@(XConfig {modMask = mod4Mask}) =
      [
        -- move focused windows using h,j,k,l
        ((mod4Mask, xK_h), withFocused (keysMoveWindow (-10, 0))),
        ((mod4Mask, xK_j), withFocused (keysMoveWindow (0, 10))),
        ((mod4Mask, xK_k), withFocused (keysMoveWindow (0, -10))),
        ((mod4Mask, xK_l), withFocused (keysMoveWindow (10, 0))),

        -- grow/shrink focused window with J/K
        ((mod4Mask .|. shiftMask, xK_j), withFocused (keysResizeWindow (20, 20) (0.5, 0.5))),
        ((mod4Mask .|. shiftMask, xK_k), withFocused (keysResizeWindow (-20, -20) (0.5, 0.5))),

        -- stretch/squeeze hor focused window with H/L
        ((mod4Mask .|. shiftMask, xK_h), withFocused (keysResizeWindow (20, 0) (0.5, 0))),
        ((mod4Mask .|. shiftMask, xK_l), withFocused (keysResizeWindow (-20, 0) (0.5, 0)))
      ]
