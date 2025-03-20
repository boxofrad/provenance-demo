FROM alpine

ADD ./build/fakeservice /bin/fakeservice

ENTRYPOINT ["/bin/fakeservice"]
