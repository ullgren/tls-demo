#!/bin/bash
#

call_server() {
    port=$1
    curl --cacert ../etc/tls/certs/snakeoil-root-ca.crt \
    --key ../etc/tls/private/user-example-com.client.key --pass changeit \
    --cert ../etc/tls/certs/user-example-com.client.crt -v https://test.local:$port

}

echo "Calling correctly setup server at https://test.local:1443 with a client certificate"
call_server 1443
echo "*************************************************************"
echo "Calling server with optional no CA at https://test.local:2443 with a client certificate"
call_server 2443
echo "*************************************************************"
echo "Calling broken server at https://test.local:3443  with a client certificate (should fail since curl does not support the AIA extension)"
call_server 3443
