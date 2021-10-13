.PHONY: clean build deploy

build-dotnetcore31-x86_64:
	mkdir -p ./bin
	docker run --rm -v "$(realpath ./dump-dotnetcore31):/tmp/build" -v "$(realpath ./bin):/tmp/bin" mcr.microsoft.com/dotnet/sdk:3.1-bullseye bash -c " \
		apt-get update && apt-get install -y zip && \
		cd /tmp/build && \
		dotnet restore && \
		dotnet tool install -g Amazon.Lambda.Tools --framework netcoreapp3.1 && \
		export PATH=\"$$PATH:/root/.dotnet/tools\" && \
		dotnet lambda package --configuration Release --framework netcoreapp3.1 --function-architecture x86_64 --output-package /tmp/bin/Release/dump-dotnetcore31/handler-x86_64.zip \
	"

build-dotnetcore31-arm64:
	mkdir -p ./bin
	docker run --rm -v "$(realpath ./dump-dotnetcore31):/tmp/build" -v "$(realpath ./bin):/tmp/bin" mcr.microsoft.com/dotnet/sdk:3.1-bullseye bash -c " \
		apt-get update && apt-get install -y zip && \
		cd /tmp/build && \
		dotnet restore && \
		dotnet tool install -g Amazon.Lambda.Tools --framework netcoreapp3.1 && \
		export PATH=\"$$PATH:/root/.dotnet/tools\" && \
		dotnet lambda package --configuration Release --framework netcoreapp3.1 --function-architecture arm64 --output-package /tmp/bin/Release/dump-dotnetcore31/handler-arm64.zip \
	"

build-dotnetcore31: build-dotnetcore31-x86_64 build-dotnetcore31-arm64

build: build-dotnetcore31

clean:
	rm -rf ./bin ./vendor

deploy: clean build
	sls deploy --verbose
