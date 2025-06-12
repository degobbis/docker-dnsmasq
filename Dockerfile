FROM alpine:edge
LABEL maintainer="10517822+degobbis@users.noreply.github.com"
# fetch dnsmasq binary
RUN apk update \
	&& apk --no-cache add dnsmasq
#configure dnsmasq
RUN mkdir -p /etc/default/
RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq
COPY dnsmasq.conf /etc/dnsmasq.conf
#run!
ENTRYPOINT ["dnsmasq","--no-daemon"]
