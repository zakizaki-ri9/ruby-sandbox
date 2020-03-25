# [PostBackAPI](https://support.treasuredata.com/hc/en-us/articles/360000675487-Postback-API)のお試し

```bash
$ curl -D a -X POST \
  -H 'Content-Type: application/json' \
  -H 'X-TD-Write-Key: XXXX' \
  --data-binary '{"param1":"value1", "param2":1234}' \
  https://in.treasuredata.com/postback/v3/event/test_db/test_tbl
{}
$ cat a
HTTP/1.1 200 OK
Content-Type: application/json
Date: Thu, 03 Dec 2015 02:31:32 GMT
Content-Length: 2
Connection: keep-alive
```

上記を、`HTTPClient`で実現する。
