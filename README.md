# woodpecker-scp
woodpecker-scp is a small plugin for weoodpecker, which allows users to upload diretories and files to any server that supports scp.

## Usage
To use woodpecker-scp use the following entries in your `.woodpecker.yml`:

```yaml
publish:
    image: git.merp.digital/eranmorkon/woodpecker-scp:latest
    settings:
        ssh_key:
            from_secret: ssh_key
        ssh_known_hosts:
            from_secret: ssh_known_hosts
        extra_flags: -r
        source: local-path
        destination: "user@server:remote-path"
```

The plugin is published in the `git.merp.digital` oci registry, the `latest` tag is always the latest release, addidtionally release tags in the format `x.y.z` point to the specified releases. The `develop` tag always holds the latest commit to the develop branch and can therefore be seen as nighty, it is definitely not stable however.

## Settings
### ssh_key
The SSH key holds the private key scp will use to connect to the server, I would recommend to generate a new private/public key pair for your CI job and add the contents of your private key file as secret. The add the public key to the server's `~/.ssh/authorized_keys` file as usual.

### ssh_known_hosts
This should be the content of the `~/.ssh/known_hosts` file. This is used to let scp verify the identity of the remote server. If you skip this step the transfer will not work, as scp can not verify that the server you are connecting to is actually the server you want to connect to. You can disable this behaviour using `extra_flags` but I highly recommend to not do that, and instead add the `known_hosts` entry.

### extra_flags
This setting is used to add extra flags to the scp command. Per default scp will be executed with the `-Bv` flags, for `batch mode` and `verbose` so you can see some output from scp in the CI log. You can add any flag that scp supports, for example `-r` for a recursive copy.

### source
The source directory scp will copy the data from, this can be in the CI container, or on a remote server, however the later one is untested at the moment.

### destination
The destination directory scp will copy the data to, this can be on a remote server, or in the CI container, however the later one is untested at the moment.

## License
Licensed under the [MIT](https://choosealicense.com/licenses/mit/) license.

`SPDX-License-Identifier: MIT`