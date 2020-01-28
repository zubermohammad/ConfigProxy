# ConfigProxy
`mvn clean install -Denv=test -Dorg=organiztion -Dusername=username -Dpassword=$password -Ptest`

# Environment Replacements in any file in apiproxy
Use a variable reference in your file as ${VARIABLE} 
``` XML
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ResponseCache async="false" continueOnError="false" enabled="true" name="ResponseCache">
    <DisplayName>ResponseCache</DisplayName>
    <Properties/>
    <CacheKey>
        <Prefix>${ENV_NAME}</Prefix>
        <KeyFragment ref="request.uri" type="string"/>
    </CacheKey>
    <CacheResource>${ECHOCACHE}</CacheResource>
    <Scope>Exclusive</Scope>
</ResponseCache>
```
Configure the env_config.txt for the file as below
```
apiproxy/targets/httpbin.xml
TARGETSERVER=AT1234_HTTPBin
---
apiproxy/policies/ResponseCache.xml
ENV_NAME=test
ECHOCACHE=AT1234_echocache
---

```

User below to apply environment variable replacements
`mvn clean package -Dreplacements.file=./env_config.txt`
To skip replacements
`mvn clean package -Dreplacements.skip=true`


