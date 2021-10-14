# Java 8 docker-lambda example

Run with:

```sh
# Will place the compiled code in `./build/docker`
docker run --rm -v "$PWD":/app -w /app gradle:6.0 gradle build

# Then you can run using that directory as the task directory
docker run --rm -v "$PWD/build/docker":/var/task mlupin/docker-lambda:java8.al2 pl.lupin.lambda.ExampleHandler '{"some": "event"}'

# OR
docker run --rm -v "$PWD/build/docker":/var/task mlupin/docker-lambda:java11 pl.lupin.lambda.ExampleHandler '{"some": "event"}'
```
