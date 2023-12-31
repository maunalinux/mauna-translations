#!/usr/bin/python3
import os

MINT_PROJECTS = ["mauna-common", "maunainstall", "maunalocale", "maunawelcome"]
CINNAMON_PROJECTS = ["cinnamon", "cinnamon-control-center", "cinnamon-session", "cinnamon-settings-daemon", "cinnamon-screensaver", "nemo", "nemo-extensions"]
SIMPLE_PO_PROJECTS = ["folder-color-switcher", "pix", "xed", "xplayer", "xreader", "xviewer", "xapp", "slick-greeter", "xfce4-xapp-status-plugin", "nvidia-prime-applet", "warpinator"]

os.system("./clean.sh")

os.chdir("po-export")

os.system("mkdir -p FOREIGN/cinnamon-translations")

# Remove templates
os.system("rm -rf */*.pot")

# special case, xedit -> xed
if os.path.exists("xedit") and os.path.exists("xed"):
    os.system("mv xedit/* xed/")
    os.system("rm -rf xedit")

for project in os.listdir("."):
    if os.path.isdir(project) and project != "FOREIGN":
        if project in SIMPLE_PO_PROJECTS:
            os.system("rename 's/%s-//' %s/*.po" % (project, project))
        if project in CINNAMON_PROJECTS:
            os.system("mv %s FOREIGN/cinnamon-translations/" % project)
        elif project not in MAUNA_PROJECTS:
            os.system("mv %s FOREIGN/" % project)
