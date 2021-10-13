FROM lambci/lambda-base

RUN curl https://docker-lambda.s3.eu-central-1.amazonaws.com/fs/python3.9-x86_64.tgz | tar -zx -C /opt


FROM mlupin/docker-lambda:provided


FROM lambci/lambda-base-2

ENV PATH=/var/lang/bin:$PATH \
    LD_LIBRARY_PATH=/var/lang/lib:$LD_LIBRARY_PATH \
    AWS_EXECUTION_ENV=AWS_Lambda_python3.9 \
    AWS_EXECUTION_ARCH=x86_64

COPY --from=0 /opt/* /var/

COPY --from=1 /var/runtime/init /var/rapid/init

USER sbx_user1051

ENTRYPOINT ["/var/rapid/init", "--bootstrap", "/var/runtime/bootstrap", "--enable-msg-logs"]
