# fiware-cygnus

## <a name="config"/> Config
To edit address of mongodb, modify [agent_mongo.conf](agent_mongo.conf) file

## <a name="running"/> Running

```bash
git clone https://github.com/itmo-swm/fiware-cygnus
cd fiware-cygnus
docker-compose up -d
```
## <a name="subscribe"/> Subscribe

To add subscribe for TempTest1 temperature:

```bash
(curl 192.168.1.199:1026/v1/subscribeContext -s -S --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Fiware-Service: my_test' --header 'Fiware-ServicePath: /' -d @- | python -mjson.tool) <<EOF
{
  "entities": [
  {
  "type": "thing",
  "isPattern": "false",
  "id": "TempTest1"
  }
  ],
  "attributes": [
  "temperature"
  ],
  "reference": "http://192.168.1.199:5050/notify",
  "duration": "P1M",
  "notifyConditions": [
  {
  "type": "ONCHANGE",
  "condValues": [
  "temperature"
  ]
  }
  ],
  "throttling": "PT1S"
}
EOF
```
