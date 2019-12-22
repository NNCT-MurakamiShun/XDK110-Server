# README

## Sensor Monitor

* Quick start
```
$ source env.sh
$ build  
$ bundle install
$ rails db:create
$ up
```

* Packet example from sensor
Please send json file to `POST /api/sensor_values` 
```json
{
	"values": [
		{"id": 1, "val": 30.1 },
		{"id": 2, "val": 1913}
	]
}
```
* Author
Murakmi Shun (Nagano-NCT)
