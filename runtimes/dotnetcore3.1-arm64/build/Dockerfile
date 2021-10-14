FROM mlupin/docker-lambda:dotnetcore3.1-arm64

FROM mlupin/docker-lambda:build-arm64

# Run: docker run --rm --entrypoint dotnet mlupin/docker-lambda:dotnetcore3.1 --info
# Check https://dotnet.microsoft.com/download/dotnet-core/3.1 for versions
ENV DOTNET_ROOT=/var/lang/bin
ENV PATH=/root/.dotnet/tools:$DOTNET_ROOT:$PATH \
  LD_LIBRARY_PATH=/var/lang/lib:$LD_LIBRARY_PATH \
  AWS_EXECUTION_ENV=AWS_Lambda_dotnetcore3.1 \
  AWS_EXECUTION_ARCH=arm64 \
  DOTNET_SDK_VERSION=3.1.405 \
  DOTNET_CLI_TELEMETRY_OPTOUT=1 \
  NUGET_XMLDOC_MODE=skip

COPY --from=0 /var/runtime /var/runtime
COPY --from=0 /var/lang /var/lang
COPY --from=0 /var/rapid /var/rapid

RUN curl -L https://dot.net/v1/dotnet-install.sh | bash -s -- -v $DOTNET_SDK_VERSION -i $DOTNET_ROOT && \
  mkdir /tmp/warmup && \
  cd /tmp/warmup && \
  dotnet new && \
  cd / && \
  rm -rf /tmp/warmup /tmp/NuGetScratch /tmp/.dotnet

# Add these as a separate layer as they get updated frequently
RUN pipx install awscli==1.* && \
  pipx install aws-lambda-builders==1.2.0 && \
  pipx install aws-sam-cli==1.15.0 && \
  dotnet tool install --global Amazon.Lambda.Tools --version 4.0.0

CMD ["dotnet", "build"]
