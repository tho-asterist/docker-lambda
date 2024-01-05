const fs = require('fs')
const { execSync } = require('child_process')
const { S3Client, PutObjectCommand } = require("@aws-sdk/client-s3")
const s3 = new S3Client({ region: 'eu-central-1' });

module.exports.handler_x86_64 = (async (e, c) => { return handler(e, c, "x86_64") })
module.exports.handler_arm64 = (async (e, c) => { return handler(e, c, "arm64") })

handler = async (event, context, arch) => {
    const execOpts = { stdio: 'inherit', maxBuffer: 16 * 1024 * 1024 }

    let filename = `nodejs20.x-${arch}.tgz`
    fs.closeSync(fs.openSync(`/tmp/${filename}`, 'w'))

    let cmd = 'tar -cpzf /tmp/' + filename +
        ' --numeric-owner --ignore-failed-read /var/runtime /var/lang /var/rapid'

    execSync(cmd, execOpts)

    console.log('Zipping done! Uploading...')

    let data = await s3.send(new PutObjectCommand({
        Bucket: 'docker-lambda',
        Key: 'fs/' + filename,
        Body: fs.createReadStream('/tmp/' + filename),
        ACL: 'public-read',
    }))

    console.log('Uploading done!')

    console.log(process.execPath)
    console.log(process.execArgv)
    console.log(process.argv)
    console.log(process.cwd())
    console.log(__filename)
    console.log(process.env)
    execSync('echo /proc/1/environ; xargs -n 1 -0 < /proc/1/environ', execOpts)
    execSync("bash -O extglob -c 'for cmd in /proc/+([0-9])/cmdline; do echo $cmd; xargs -n 1 -0 < $cmd; done'", execOpts)
    console.log(context)

    return data
}
