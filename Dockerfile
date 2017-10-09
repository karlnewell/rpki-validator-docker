FROM openjdk:8-jre

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
 rsync \
 curl \
 && rm -rf /var/lib/apt/lists/*

RUN curl -O https://rrdp.ripe.net/certification/content/static/validator/rpki-validator-app-2.23-dist.tar.gz

RUN tar xzpf rpki-validator-app-2.23-dist.tar.gz
RUN curl -o /rpki-validator-app-2.23/conf/tal/arin-ripevalidator.tal https://www.arin.net/resources/rpki/arin-ripevalidator.tal

WORKDIR rpki-validator-app-2.23

EXPOSE 8080 8282

ENTRYPOINT ["/rpki-validator-app-2.23/rpki-validator.sh", "run"]
