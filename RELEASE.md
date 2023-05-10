# Releasing CLI

Prerequisites:

* `gem install rake aws-sdk-s3`
* `particle-cli-wrapper` repo
* AWS access for the S3 bucket `mode-static-binaries-particle-io-20230314171309486000000003`

Instructions:

* Increment version
* Update CHANGELOG
* Provide AWS credentials by logging in to AWS through the browser, clicking  Command line or programmatic access and copy-pasting the short term credentials into the terminal
* [optional] Update `beta` branch with latest changes.
* [optional] Run `rake release` on beta branch to test changes.
* [optional] macOS, Linux: Run `CHANNEL=beta bash <( curl -sL https://particle.io/install-cli )` to install the beta
* Run `rake release` on master branch.

Notes:

Make sure the user with the S3 credentials above have these permissions.

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::mode-static-binaries-particle-io-20230314171309486000000003"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::mode-static-binaries-particle-io-20230314171309486000000003/*"
            ]
        }
    ]
}
```
