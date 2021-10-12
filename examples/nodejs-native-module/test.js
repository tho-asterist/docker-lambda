var dockerLambda = require('../..')

var match = dockerLambda({ event: { password: 'lambda-docker' }, dockerImage: 'mlupin/docker-lambda:nodejs12.x' })

console.log(match === 'Matches!' ? 'Match Passed' : 'Match Failed: ' + match)

var nonMatch = dockerLambda({ event: { password: 'lambda-mocker' }, dockerImage: 'mlupin/docker-lambda:nodejs12.x' })

console.log(nonMatch === 'NopeNopeNope' ? 'Non-Match Passed' : 'Non-Match Failed: ' + nonMatch)
