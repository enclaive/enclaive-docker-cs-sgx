# mariadb with patches

FROM enclaive/gramine-os:jammy-7e9d6925

RUN apt-get update \
    && apt-get install -y  wget build-essential mono-complete \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app/

COPY ./app /app/
COPY ./app.manifest.template ./entrypoint.sh /app/

RUN make

RUN gramine-argv-serializer "/usr/bin/mono" "/app/app.exe" > args.txt &&\
    gramine-manifest -Darch_libdir=/lib/x86_64-linux-gnu app.manifest.template app.manifest &&\
    gramine-sgx-sign --key "$SGX_SIGNER_KEY" --manifest app.manifest --output app.manifest.sgx

EXPOSE 3306/tcp

ENTRYPOINT [ "/app/entrypoint.sh" ]
