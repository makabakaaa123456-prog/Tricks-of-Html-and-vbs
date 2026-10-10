import ctypes
import time

user32 = ctypes.windll.user32

andMask = (ctypes.c_byte * 128)(*([0xFF] * 128))
xorMask = (ctypes.c_byte * 128)(*([0x00] * 128))
blank_cursor = user32.CreateCursor(None, 0, 0, 32, 32, andMask, xorMask)

cursor_ids = [
    32512,  # Arrow
    32513,  # IBeam
    32514,  # Wait
    32515,  # Cross
    32516,  # UpArrow
    32642,  # SizeNWSE
    32643,  # SizeNESW
    32644,  # SizeWE
    32645,  # SizeNS
    32646,  # SizeAll
    32648,  # No
    32649,  # Hand
    32650,  # AppStarting
]

for cursor_id in cursor_ids:
    user32.SetSystemCursor(user32.CopyIcon(blank_cursor), cursor_id)


try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    ctypes.windll.user32.SystemParametersInfoW(0x0057, 0, None, 0)
    print("Cursor restored!")
