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
        -- move focused windows using y,u,i,o
        ((mod4Mask, xK_y), withFocused (keysMoveWindow (-20, 0))),
        ((mod4Mask, xK_u), withFocused (keysMoveWindow (0, 20))),
        ((mod4Mask, xK_i), withFocused (keysMoveWindow (0, -20))),
        ((mod4Mask, xK_o), withFocused (keysMoveWindow (20, 0))),

        -- grow/shrink vertical focused window with U,I
        ((mod4Mask .|. shiftMask, xK_u), withFocused (keysResizeWindow (0, 20) (0, 0))),
        ((mod4Mask .|. shiftMask, xK_i), withFocused (keysResizeWindow (0, -20) (0, 0))),

        -- grow/shring horizontal focused window with O,Y
        ((mod4Mask .|. shiftMask, xK_o), withFocused (keysResizeWindow (20, 0) (0, 0))),
        ((mod4Mask .|. shiftMask, xK_y), withFocused (keysResizeWindow (-20, 0) (0, 0)))
      ]

