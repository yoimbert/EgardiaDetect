# Egardia Detect for HC2 Fibaro

Simple script Lua and Shell for detect sensor Egardia with HC2 Fibaro

* egardiaDetect.lua script Lua for console HC2
* curljson.sh recovering json file from Alarm Central Egardia


```
#!/bin/sh
curl -v http://USER:PASSWORD@IP/action/sensorListGet > /var/www/website.ltd/web/egardia/egardiacron.json

exit
```

<https://www.yoh.im>

![Yoim logo](https://yoh.im/assets/img/yoim.png "YOIM logo")