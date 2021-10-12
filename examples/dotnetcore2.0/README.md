# .NET Core 2.0 docker-lambda example

```sh
# Will place the compiled code in `./pub`
docker run --rm -v "$PWD":/var/task mlupin/docker-lambda:build-dotnetcore2.0 dotnet publish -c Release -o pub

# Then you can run using that as the task directory
docker run --rm -v "$PWD"/pub:/var/task mlupin/docker-lambda:dotnetcore2.0 test::test.Function::FunctionHandler '{"some": "event"}'
```
