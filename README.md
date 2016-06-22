# cloud controller test container

This runs [cloud controller] tests.

[cloud controller]: https://github.com/cloudfoundry/cloud_controller_ng

Usage:

```sh
cd …/cloud_controller_ng
docker run --rm -t --volume=$PWD:/src:ro mookas/cc-test
```
