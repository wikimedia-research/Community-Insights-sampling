# Pywikibot expects configuration data in this location
from secrets.oauth import *

mylang = "meta"
family = "meta"
usernames["meta"]["meta"] = "WMF Surveys"

# THIS FILE IS PUBLIC. 
# DO NOT ADD AUTH INFORMATION DIRECTLY.
authenticate["meta.wikimedia.org"] = (
    consumer_token,
    consumer_secret,
    access_token,
    access_secret
)