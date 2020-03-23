# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

define_multipurpose_modmap({
    Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
    Key.RIGHT_CTRL: [Key.ESC, Key.RIGHT_CTRL],
    Key.LEFT_CTRL: [Key.ESC, Key.LEFT_CTRL],
    Key.LEFT_ALT: [Key.MUHENKAN, Key.LEFT_ALT],
    Key.RIGHT_ALT: [Key.HENKAN, Key.RIGHT_ALT]
})

# emacs-like keybindings in non-emacs applications
define_keymap(lambda wm_class: wm_class not in ("Emacs", "URxvt"), {
    # Newline
    K("C-m"): K("enter"),
    # Newline
    K("C-f"): K("right"),
    K("C-b"): K("left"),
    K("C-p"): K("up"),
    K("C-n"): K("down"),
}, "Emacs-like keys")
